import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/purchase/purchase_model.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/create_product_page/params/create_product_page_params.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/grid_shop_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/shop_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/bottom_sheet_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/shop_info_sheet.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_profile_header.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/pagination_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class ShopPage extends BaseStatefulWidget {
  const ShopPage({Key? key})
      : super(
          key: key,
          includeFab: true,
        );

  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends BaseStatefulWidgetState<ShopPage, ShopCubit> {
  @override
  void initialization() {
    cubit.get();
  }

  @override
  Widget body(BuildContext context) {
    return BlocListener<ShopCubit, BasePaginationState>(
      listener: _listenToPurchaseProduct,
      child: Column(
        children: [
          RowProfileHeader(
            title: context.getStrings.shop,
            action: BlocBuilder<ShopCubit, BasePaginationState>(
              buildWhen: _buildWhenPurchaseSuccess,
              builder: (context, state) {
                return Row(
                  children: [
                    TextWidget.medium(
                      state is SuccessPurchaseRequestState ?state.purchaseModel.coinAmount.toString(): (cubit.userCompanyModel?.coinAmount).toString(),
                      context: context,
                      direction: TextDirection.ltr,
                      additionalStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const ImageLoaderWidget.fromAsset(
                      imageUrl: Assets.silverCoin,
                      height: 32,
                      width: 32,
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: PaginationWidget<ProductModel, ShopCubit>(
              onData: (productItems) => GridView.builder(
                shrinkWrap: true,
                itemCount: productItems.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 160,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return GridShopItemWidget(
                    shopModel: productItems[index],
                    onShopItemLongPress: () {
                      _showShopInfoBottomSheet(productItems[index], index);
                    },
                    onShopItemClick: () =>
                        _showPurchaseDialog(productItems[index]),
                  );
                },
              ),
              loadingWidget: const ShopPageSkeleton(),
              deleteItemListener: _listenToDeleteProduct,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onFabClick(BuildContext context) {
    Navigator.pushNamed(context, Routes.createProductPage);
    super.onFabClick(context);
  }

  void _showShopInfoBottomSheet(ProductModel productModel, int index) {
    showKodusBottomSheet(
      context,
      (_) => ShopInfoBottomSheet(
        shopModel: productModel,
        onTapEdit: () {
          Navigator.pushNamed(
            context,
            Routes.createProductPage,
            arguments: CreateShopPageParams(
              imageUrl: productModel.avatar,
              count: productModel.amount,
              coinCount: productModel.coin,
              shopName: productModel.name,
              validity: productModel.expirationDate?.formattedJalaliDate,
            ),
          );
        },
        onTapDelete: () {
          Navigator.pop(context);
          _showDeleteProductDialog(productModel, index);
        },
      ),
    );
  }

  void _showPurchaseDialog(ProductModel product) {
    showKodusDialog(
      context,
      (_) => DialogDefaultStyle(
        title: '',
        question: '',
        acceptButtonColor: Theme.of(context).colorScheme.surfaceVariant,
        onAccept: () async {
          await cubit.postPurchaseProduct(product.id ?? -1);
        },
        onReject: () {
          Navigator.pop(context);
        },
        acceptButtonText: context.getStrings.titleContinue,
        child: TextWidget.medium(
          sprintf(context.getStrings.phForPurchase, [
            product.name,
            product.coin,
          ]),
          context: context,
          additionalStyle: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void _showDeleteProductDialog(ProductModel product, int index) {
    showKodusDialog(
      context,
      (_) => DialogDefaultStyle(
        title: context.getStrings.deleteProduct,
        acceptButtonText: context.getStrings.delete,
        question:
            context.getStrings.areYouSureToDeleteProduct(product.name ?? ""),
        onAccept: () async {
          await cubit.deleteProduct(index);
        },
        onReject: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showSuccessPurchaseProductDialog(PurchaseModel purchaseModel) {
    showKodusDialog(
      context,
      (_) => DialogDefaultStyle(
        title: context.getStrings.purchaseSuccess,
        question: context.getStrings
            .yourTrackingCodeIs(purchaseModel.trackingCode ?? ''),
        additionTitleStyle: TextStyle(color: Theme.of(context).colorScheme.surfaceVariant),
        footerChild: CustomButton.fill(
          context: context,
          text: context.getStrings.back,
          height: 36,
          onPressed: () => context.dismissModal(),
          additionalTextStyle: const TextStyle(
            fontSize: 14,
          ),
          borderRadius: 8,
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }

  void _listenToDeleteProduct(DeletePaginationItemState<ProductModel> state) {
    state.whenOrNull(
      success: (index) {
        context.dismissModal();
      },
    );
  }

  void _listenToPurchaseProduct(
      BuildContext context, BasePaginationState state) {
    if (state is PurchaseRequestState) {
      state.whenOrNull(
        success: (purchaseModel) {
          context.dismissModal();
          _showSuccessPurchaseProductDialog(purchaseModel);
        },
        failed: (message) => context.dismissModal(),
      );
    }
  }

  bool _buildWhenPurchaseSuccess(
          BasePaginationState prv, BasePaginationState current) =>
      current is SuccessGetUserState || current is SuccessPurchaseRequestState;
}
