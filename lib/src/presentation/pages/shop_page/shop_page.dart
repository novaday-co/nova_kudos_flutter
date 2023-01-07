import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/create_shop_page/params/create_shop_page_params.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/grid_shop_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/shop_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/bottom_sheet_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/shop_info_sheet.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_profile_header.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/pagination_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class ShopPage extends BaseStatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

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
    return Column(
      children: [
        RowProfileHeader(
          title: context.getStrings.shop,
          action: FloatingActionButton(
            mini: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            child: Center(
              child: IconWidget(
                icon: Icons.add,
                iconColor: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.createShopPage);
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: PaginationWidget<ShopModel, ShopCubit>(
            onData: (shopItems) => GridView.builder(
              shrinkWrap: true,
              itemCount: shopItems.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 155,
              ),
              itemBuilder: (context, index) {
                return GridShopItemWidget(
                  shopModel: shopItems[index],
                  onShopItemLongPress: () {
                    _showShopInfoBottomSheet(shopItems[index]);
                  },
                  onShopItemClick: () {
                    showKodusDialog(
                      context,
                      (_) => DialogDefaultStyle(
                        title: '',
                        question: '',
                        acceptButtonColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        onAccept: () async {
                          Navigator.pop(context);
                        },
                        onReject: () {
                          Navigator.pop(context);
                        },
                        acceptButtonText: context.getStrings.titleContinue,
                        child: TextWidget.medium(
                          sprintf(context.getStrings.phForPurchase, [
                            shopItems[index].title,
                            shopItems[index].price,
                          ]),
                          context: context,
                          additionalStyle: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            loadingWidget: const ShopPageSkeleton(),
          ),
        ),
      ],
    );
  }

  void _showShopInfoBottomSheet(ShopModel shopModel) {
    showKodusBottomSheet(
      context,
      (_) => ShopInfoBottomSheet(
        shopModel: shopModel,
        onTapEdit: () {
          Navigator.pushNamed(
            context,
            Routes.createShopPage,
            arguments: CreateShopPageParams(
              imageUrl: shopModel.image,
              count: shopModel.price,
              coinCount: shopModel.price,
              shopName: shopModel.title,
              validity: shopModel.endAt?.formattedJalaliDate,
            ),
          );
        },
        onTapDelete: () {},
      ),
    );
  }
}
