import 'package:flutter/material.dart';

Future<T?> showKodusDialog<T>(
  BuildContext context,
  Widget Function(BuildContext context) builder, {
  bool? isScrollControlled,
  bool? isDismissible,
}) async {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: isDismissible ?? true,
    barrierLabel: "",
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return Transform.scale(
        scale: animation.value,
        child: Opacity(
          opacity: animation.value,
          child: builder.call(context),
        ),
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return const SizedBox();
    },
  );
}
