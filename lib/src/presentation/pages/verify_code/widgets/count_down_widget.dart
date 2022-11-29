import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/string_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

class CountDownWidget extends StatelessWidget {
  final int remained;
  final Function() onTimeoutClick;
  final bool  isLoading;

  const CountDownWidget({
    Key? key,
    required this.remained,
    required this.onTimeoutClick,
    this.isLoading=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const Loading(primaryLoading: true);
    }
    else if (isTimeOut) {
      return InkWell(
        onTap: onTimeoutClick,
        child: TextWidget.bold(
          context.getStrings.resendCode,
          context: context,
          additionalStyle: const TextStyle(fontSize: 18),
        ),
      );
    } else {
      return TextWidget.bold(
        formattedTime,
        context: context,
        direction: TextDirection.ltr,
        additionalStyle: const TextStyle(fontSize: 18),
      );
    }
  }

  bool get isTimeOut {
    if (remained >= 0) {
      return false;
    } else {
      return true;
    }
  }
  String get formattedTime {
    int sec = remained % 60;
    int min = (remained / 60).floor();
    return "${min.toString().appendZeroPrefix} : ${sec.toString().appendZeroPrefix}";
  }
}
