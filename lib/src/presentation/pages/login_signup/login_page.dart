import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        hasBackButton: false,
        title: 'ورود یا ثبت نام',
        centerTitle: false,
      ),
      body: Column(
        children: [
          CustomTextField(label: 'شماره موبایل',)
        ],
      ),
    );
  }
}
