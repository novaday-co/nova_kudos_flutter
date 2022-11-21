import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/custom_text_field.dart';

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
          ),
        ],
      ),
    );
  }
}
