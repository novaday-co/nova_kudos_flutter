import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code/widgets/code_input_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code/widgets/count_down_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/button_widget.dart';

class VerifyCodePage extends BaseStatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  late VerifyCodePageParam? params;

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: 'تایید کد ارسال شده به ${params?.phoneNumber}',
      centerTitle: false,
      onPressBack: (){
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        CodeInputWidget(
          onSubmitted: (value) {},
          hasError: false,
          errorText: '',
        ),
        const SizedBox(height: 25),
        CustomButton.fill(
          context: context,
          text: context.getStrings.authorizeCode,
          loadingType: ButtonLoadingType.percentage,
          loadingStatus: ButtonLoadingStatus.normal,
          isPrimaryCircularLoading: false,
          onPressed: () {},
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
                isLoading: state is LoadingResendCodeState,
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

  ///region Bloc When Conditions Functions

  bool _buildWhenTimer(VerifyCodeState previous, VerifyCodeState current) {
    return current is TimerStates || current is LoadingResendCodeState;
  }

  ///endregion

}
