import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/widgets/code_input_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/widgets/count_down_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:sprintf/sprintf.dart';

class VerifyCodePage extends BaseStatelessWidget {
  final VerifyCodePageParam? params;

  const VerifyCodePage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: sprintf(
          context.getStrings.confirmCodeSendTo, [params?.phoneNumber ?? '']),
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
        BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
          buildWhen: _buildWhenFailedVerifyCode,
          builder: (context, state) {
            return CodeInputWidget(
              onSubmitted: (value) {
                context.read<VerifyCodeCubit>().otp = value;
                context.read<VerifyCodeCubit>().postVerify(
                      phoneNumber: params?.phoneNumber ?? '',
                      otp: context.read<VerifyCodeCubit>().otp,
                      isEdit: params?.isEdit ?? false,
                    );
              },
              onChanged: (value) {
                context.read<VerifyCodeCubit>().validateVerifyCode(value);
              },
              hasError: state is FailedVerifyRequestState,
              errorText: state.isA<FailedVerifyRequestState>()?.error,
            );
          },
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
                      phoneNumber: params?.phoneNumber ?? '',
                      otp: context.read<VerifyCodeCubit>().otp,
                      isEdit: params?.isEdit ?? false,
                    );
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
                  context
                      .read<VerifyCodeCubit>()
                      .postResendCode(params?.phoneNumber ?? '');
                },
              );
            },
          ),
        )
      ],
    );
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
    return current is TimerStates ||
        current is LoadingResendCodeRequestState ||
        current is FailedResendCodeRequestState;
  }

  bool _buildWhenVerifyCode(VerifyCodeState previous, VerifyCodeState current) {
    return current is VerifyRequestState ||
        current is VerifyCodeValidationState;
  }

  bool _buildWhenFailedVerifyCode(
      VerifyCodeState previous, VerifyCodeState current) {
    return current is FailedVerifyRequestState;
  }

  ///endregion
  ///region Bloc Listeners

  void _listenToVerifyCode(BuildContext context, VerifyCodeState state) {
    if (params?.isEdit ?? false) {
      Navigator.pop(context, true);
    } else {
      Navigator.pushNamed(context, Routes.landingPage);
    }
  }

  ///endregion

  ///region Listen When Conditions Functions

  bool _listenWhenToVerifyCodeState(
      VerifyCodeState previous, VerifyCodeState current) {
    return current is SuccessVerifyRequestState;
  }

  ///endregion

}
