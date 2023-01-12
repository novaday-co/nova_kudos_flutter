import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/create_product_page/params/create_product_page_params.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/upload_image.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/tag_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';

class CreateShopPage extends BaseStatelessWidget<CreateShopCubit> {
  final CreateShopPageParams? params;

  const CreateShopPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      title: context.getStrings.createShop,
      hasBackButton: true,
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget? bottomNavigation() {
    return BlocBuilder<CreateShopCubit, BaseFileState>(
      buildWhen: _buildWhenCreateButton,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: CustomButton.fill(
            context: context,
            text: context.getStrings.submit,
            loadingStatus: _buttonLoadingStatus(state),
            isEnable: state is CreateProductValidFormState ||
                state is CreateProductState,
            loadingType: ButtonLoadingType.percentage,
            onPressed: () {
              context.read<CreateShopCubit>().postNewProduct();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return BlocListener<CreateShopCubit, BaseFileState>(
      listener: _listenToCreateProductState,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CreateShopCubit, BaseFileState>(
              buildWhen: _buildWhenProfilePicture,
              builder: (context, state) {
                return UploadImage<CreateShopCubit>(
                  image: state is SelectedImageFileState
                      ? state.imageFile.path
                      : params?.imageUrl,
                  height: 90,
                  width: 1000,
                  tagAlignment: Alignment.bottomRight,
                  nullImageWidget: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconWidget(
                          icon: Assets.iconGallery,
                          size: 24,
                          height: 24,
                          width: 24,
                          iconColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        const SizedBox(height: 4),
                        TagWidget.rectangle(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          value: context.getStrings.eventPicture,
                          padding: 4,
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  tagWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: TagWidget.rectangle(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        value: context.getStrings.changePicture,
                        padding: 4,
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              initValue: params?.shopName,
              label: context.getStrings.shopName,
              textInputType: TextInputType.text,
              onChanged: (value) {
                context.read<CreateShopCubit>().setProductName(value);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              initValue: params?.validity,
              label: context.getStrings.validityPeriod,
              textInputType: TextInputType.text,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              initValue: params?.count.toString(),
              label: context.getStrings.numberOfInventory,
              textInputType: TextInputType.number,
              onChanged: (value) =>
                  context.read<CreateShopCubit>().setProductAmount(value),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              initValue: params?.coinCount.toString(),
              label: context.getStrings.productPrice,
              textInputType: TextInputType.number,
              onChanged: (value) {
                context.read<CreateShopCubit>().setProductValue(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///region Bloc When Conditions Functions

  bool _buildWhenProfilePicture(BaseFileState previous, BaseFileState current) {
    return current is SelectedImageFileState;
  }

  bool _buildWhenCreateButton(BaseFileState previous, BaseFileState current) {
    return current is CreateProductState ||
        current is CreateProductFormValidationState;
  }

  ///endregion
  ///region Bloc Listeners
  void _listenToCreateProductState(BuildContext context, BaseFileState state) {
    state.isA<CreateProductState>()?.whenOrNull(
          success: () {
            context.showSuccessSnackBar(context.getStrings.productAddedSuccess);
            Navigator.pop(context, true);
          },
          failed: (error) => context.showFailedSnackBar(error),
        );
  }

  /// endregion

  ButtonLoadingStatus _buttonLoadingStatus(BaseFileState state) {
    if (state is LoadingCreateProductState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessCreateProductState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }
}
