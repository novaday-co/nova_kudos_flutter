import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code/param/verify_code_page_param.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/base_stateless_widget.dart';

class VerifyCodePage extends BaseStatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  late VerifyCodePageParam? params;

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: 'تایید کد ارسال شده به ${params?.phoneNumber}',
      centerTitle: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [],
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
}
