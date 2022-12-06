import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code_page/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';

class LoginPage extends BaseStatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: false,
      title: context.getStrings.login,
      centerTitle: false,
    );
  }

  String phoneNumber = "";


  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomTextField(
            label: context.getStrings.phoneNumber,
            textInputType: TextInputType.phone,
            onChanged: (value) {
              phoneNumber = value;
              context.read<LoginCubit>().validatePhoneNumber(value);
            },
          ),
          const Spacer(),
          BlocConsumer<LoginCubit, LoginState>(
            listener: _listenToLoginState,
            listenWhen: _listenWhenToLoginState,
            buildWhen: _buildWhenPhoneNumberInput,
            builder: (context, state) => CustomButton.fill(
              context: context,
              text: context.getStrings.verificationCode,
              loadingType: ButtonLoadingType.percentage,
              loadingStatus: _buttonLoadingStatus(state),
              isEnable: state is LoginValidPhoneNumberState,
              onPressed: () {
                context.read<LoginCubit>().postLogin(phoneNumber: phoneNumber);
              },
            ),
          ),
        ],
      ),
    );
  }

  ButtonLoadingStatus _buttonLoadingStatus(LoginState state){
    if(state is LoadingLoginRequestState){
      return ButtonLoadingStatus.loading;
    }
    if(state is SuccessLoginRequestState){
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  bool _buildWhenPhoneNumberInput(LoginState previous, LoginState current) {
    return current is LoginPhoneNumberValidationState ||
        current is LoginRequestState;
  }

  bool _listenWhenToLoginState(LoginState previous, LoginState current) {
    return current is SuccessLoginRequestState;
  }

  void _listenToLoginState(BuildContext context, LoginState state) {
    Navigator.pushNamed(context, Routes.verifyCode,arguments: VerifyCodePageParam(phoneNumber: phoneNumber));
  }
}
