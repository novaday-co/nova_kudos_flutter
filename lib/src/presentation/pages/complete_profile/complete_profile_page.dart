import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/upload_image.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/tag_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';

class CompleteProfilePage extends BaseStatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState
    extends BaseStatefulWidgetState<CompleteProfilePage, CompleteProfileCubit> {
  TextEditingController phoneController = TextEditingController();

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: context.getStrings.editProfile,
      onPressBack: () {
        Navigator.pop(context);
      },
      centerTitle: true,
    );
  }

  @override
  Widget? bottomWidget() {
    return BlocBuilder<CompleteProfileCubit, BaseFileState>(
      buildWhen: _buildWhenSaveButton,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: CustomButton.fill(
            context: context,
            text: context.getStrings.submit,
            loadingType: ButtonLoadingType.percentage,
            isEnable: state is CompleteProfileValidFormState ||
                state is ChangePhoneProfileState,
            loadingStatus: _buttonLoadingStatus(state),
            onPressed: () {
              if (state is CompleteProfileValidFormState) {
                cubit.postChangePhone(phoneController.text);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, BaseFileState>(
      listener: _listenToProfileStates,
      buildWhen: _buildWhenProfileInformation,
      builder: (context, state) =>
          state.isA<CompleteProfileGetUserState>()!.when(
                loading: () => const Center(
                  child: Loading(
                    primaryLoading: true,
                  ),
                ),
                success: () => SingleChildScrollView(
                  child: Column(
                    children: [
                      UploadImage<CompleteProfileCubit>(
                        image: cubit.userCompanyModel?.avatar,
                        tagAlignment: Alignment.bottomCenter,
                        shape: BoxShape.circle,
                        height: 100,
                        width: 100,
                        tagWidget: Align(
                          heightFactor: 0.0,
                          child: TagWidget.rectangle(
                            padding: 3,
                            value: context.getStrings.changeProfilePicture,
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.heightPercentage(5),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        label: context.getStrings.phoneNumber,
                        textInputType: TextInputType.phone,
                        controller: phoneController,
                        initValue: cubit.userCompanyModel?.phoneNumber ?? "",
                        inputFormatters: [LengthLimitingTextInputFormatter(11)],
                        onChanged: (phone) => cubit.onChangedPhoneNumber(phone),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  ButtonLoadingStatus _buttonLoadingStatus(BaseFileState state) {
    if (state is LoadingChangePhoneProfileState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessChangePhoneProfileState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  bool _buildWhenSaveButton(BaseFileState previous, BaseFileState current) {
    return current is CompleteProfileFormValidationState ||
        current is ChangePhoneProfileState;
  }

  bool _buildWhenProfileInformation(
      BaseFileState previous, BaseFileState current) {
    return current is CompleteProfileGetUserState;
  }

  void _listenToProfileStates(BuildContext context, BaseFileState state) {
    state.isA<ChangePhoneProfileState>()?.whenOrNull(
          success: () => Navigator.pushNamed(
            context,
            Routes.verifyCode,
            arguments: VerifyCodePageParam(
              phoneNumber: phoneController.text,
              isEdit: true,
            ),
          ).then((isMobileChanged) {
            if (isMobileChanged is bool && isMobileChanged) {
              cubit.updatePhoneNumberInLocal(phoneController.text);
              context.showSuccessSnackBar(
                  context.getStrings.msgProfileUpdatedSuccess);
            }
          }),
        );

    state.isA<SuccessUploadingFileState>()?.whenOrNull(
      success: () {
        context
            .showSuccessSnackBar(context.getStrings.msgPictureUpdatedSuccess);
      },
    );

    state.isA<SelectImageFileState>()?.whenOrNull(
          select: (imageFile) => cubit.upload(imageFile),
        );
  }
}
