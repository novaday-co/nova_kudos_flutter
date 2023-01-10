import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/params/complete_profile_params.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/upload_image.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';

class CompleteProfilePage extends BaseStatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState
    extends BaseStatefulWidgetState<CompleteProfilePage, CompleteProfileCubit> {
  late CompleteProfilePageParams params;

  @override
  void onBuild(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      params = ModalRoute.of(context)?.settings.arguments
          as CompleteProfilePageParams;
    }
    return super.onBuild(context);
  }

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: params.isEdit
          ? context.getStrings.editProfile
          : context.getStrings.login,
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
            isEnable: state is CompleteProfileValidFormState,
            loadingStatus: _buttonLoadingStatus(state),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.landingPage, (route) => false);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, BaseFileState>(
      buildWhen: _buildWhenProfileInformation,
      builder: (context, state) =>
          state.isA<CompleteProfileGetUserState>()!.when(
                loading: () => const Loading(
                  primaryLoading: true,
                ),
                success: () => SingleChildScrollView(
                  child: Column(
                    children: [
                      UploadImage(
                        uploadImageUrl: cubit.userCompanyModel?.avatar ?? "",
                        imageViewType: UploadImageViewType.circular,
                        image: cubit.userCompanyModel?.avatar,
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
                        initValue: cubit.userCompanyModel?.phoneNumber ?? "",
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  ButtonLoadingStatus _buttonLoadingStatus(BaseFileState state) {
    if (state is LoadingCompleteProfileRequestState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessCompleteProfileRequestState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  bool _buildWhenSaveButton(
      BaseFileState previous, BaseFileState current) {
    return current is CompleteProfileValidFormState;
  }

  bool _buildWhenProfileInformation(
      BaseFileState previous, BaseFileState current) {
    return current is CompleteProfileGetUserState;
  }
}
