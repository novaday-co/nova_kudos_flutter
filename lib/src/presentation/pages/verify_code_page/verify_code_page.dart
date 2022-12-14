import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/params/complete_profile_params.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/widgets/code_input_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/widgets/count_down_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:sprintf/sprintf.dart';

class VerifyCodePage extends BaseStatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  late VerifyCodePageParam? params;
  String otp = "";

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: sprintf(context.getStrings.confirmCodeSendTo,[params?.phoneNumber??'']),
      centerTitle: false,
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        CodeInputWidget(
          onSubmitted: (value) {
            otp = value;
            context
                .read<VerifyCodeCubit>()
                .postVerify(phoneNumber: params?.phoneNumber ?? '', otp: otp);
          },
          onChanged: (value) {
            context.read<VerifyCodeCubit>().validateVerifyCode(value);
          },
          hasError: false,
          errorText: '',
        ),
        const SizedBox(height: 25),
        BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
          listener: _listenToVerifyCode,
          listenWhen: _listenWhenToVerifyCodeState,
          buildWhen: _buildWhenVerifyCode,
          builder: (context, state) {
            return CustomButton.fill(
              context: context,
              text: context.getStrings.authorizeCode,
              loadingType: ButtonLoadingType.percentage,
              loadingStatus: _buttonLoadingStatus(state),
              isPrimaryCircularLoading: false,
              isEnable: state is VerifyCodeValidValidationState,
              onPressed: () {
                context.read<VerifyCodeCubit>().postVerify(
                    phoneNumber: params?.phoneNumber ?? '', otp: otp);
              },
            );
          },
        ),
        const SizedBox(height: 32),
        Center(
          child: BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
            buildWhen: _buildWhenTimer,
            builder: (context, state) {
              int remained = -1;
              if (state is TimerUpdateState) {
                remained = state.remained;
              }
              return CountDownWidget(
                isLoading: state is LoadingResendCodeRequestState,
                remained: remained,
                onTimeoutClick: () {
                  context.read<VerifyCodeCubit>().postResendCode();
                },
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void onBuild(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      params =
          (ModalRoute.of(context)?.settings.arguments) as VerifyCodePageParam;
    }
    super.onBuild(context);
  }

  ButtonLoadingStatus _buttonLoadingStatus(VerifyCodeState state) {
    if (state is LoadingVerifyRequestState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessVerifyRequestState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  ///region Bloc When Conditions Functions

  bool _buildWhenTimer(VerifyCodeState previous, VerifyCodeState current) {
    return current is TimerStates || current is LoadingResendCodeRequestState;
  }

  bool _buildWhenVerifyCode(VerifyCodeState previous, VerifyCodeState current) {
    return current is VerifyRequestState ||
        current is VerifyCodeValidationState;
  }

  ///endregion
  ///region Bloc Listeners

  void _listenToVerifyCode(BuildContext context, VerifyCodeState state) {
    Navigator.pushNamed(context, Routes.completeProfile,
        arguments:
            CompleteProfilePageParams(phoneNumber: params?.phoneNumber ?? ''));
  }

  ///endregion

  ///region Listen When Conditions Functions

  bool _listenWhenToVerifyCodeState(
      VerifyCodeState previous, VerifyCodeState current) {
    return current is SuccessVerifyRequestState;
  }

  ///endregion

}
