import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_field_widget.dart';

class LoginPage extends BaseStatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: false,
      title: context.getStrings.login,
      centerTitle: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomTextField(
            label: context.getStrings.phoneNumber,
            textInputType: TextInputType.phone,
            onChanged: (value){
              context.read<LoginCubit>().validatePhoneNumber(value);
            },
          ),
          Visibility(
            visible: context.isKeyboardUp,
            replacement: const Spacer(),
            child: const SizedBox(
              height: 24,
            ),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: _buildWhenPhoneNumberInput,
            builder: (context, state) => CustomButton.fill(
              context: context,
              text: context.getStrings.verificationCode,
              loadingType: ButtonLoadingType.percentage,
              loadingStatus: ButtonLoadingStatus.complete,
              onPressed:  () {

              } ,
            ),
          ),
        ],
      ),
    );
  }

  bool _buildWhenPhoneNumberInput(LoginState previous, LoginState current) {
    return current is LoginPhoneNumberValidationState;
  }
}


