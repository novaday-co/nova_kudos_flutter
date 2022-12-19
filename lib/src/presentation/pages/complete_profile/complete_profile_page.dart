import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/params/complete_profile_params.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/tag_widget.dart';
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
      title: params.isEdit ? context.getStrings.editProfile:context.getStrings.login,
      onPressBack: () {
        Navigator.pop(context);
      },
      centerTitle: true,
    );
  }

  @override
  Widget? bottomNavigation() {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
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
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            buildWhen: _buildWhenProfilePicture,
            builder: (context, state) => ImageLoaderWidget.fromFile(
              imageUrl: state is SelectCompleteProfilePictureState
                  ? state.imagePath
                  : "",
              width: 90,
              height: 90,
              boxShape: BoxShape.circle,
              hasTag: true,
              tagAlignment: Alignment.bottomCenter,
              onTap: () {
                context
                    .read<CompleteProfileCubit>()
                    .selectProfilePicture(context);
              },
              tagWidget: Align(
                heightFactor: 0.0,
                child: TagWidget.rectangle(
                  padding: 4,
                  value: context.getStrings.changeProfilePicture,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.heightPercentage(5),
          ),
          CustomTextField(
            label: context.getStrings.username,
            textInputType: TextInputType.phone,
            onChanged: (value) {
              context.read<CompleteProfileCubit>().profileForm(value);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            label: context.getStrings.jobTitle,
            textInputType: TextInputType.phone,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            label: context.getStrings.phoneNumber,
            textInputType: TextInputType.phone,
            readOnly: true,
            initValue: params.phoneNumber ?? "",
          ),
        ],
      ),
    );
  }

  ButtonLoadingStatus _buttonLoadingStatus(CompleteProfileState state) {
    if (state is LoadingCompleteProfileRequestState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessCompleteProfileRequestState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  bool _buildWhenSaveButton(
      CompleteProfileState previous, CompleteProfileState current) {
    return current is CompleteProfileValidFormState;
  }

  bool _buildWhenProfilePicture(
      CompleteProfileState previous, CompleteProfileState current) {
    return current is CompleteProfilePictureState;
  }
}
