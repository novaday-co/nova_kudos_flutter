import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const Responsive({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          if (constraints.maxWidth != 0) {
            ScreenUtil.init(
              context,
              designSize: const Size(375, 812),
              splitScreenMode: false,
              minTextAdapt: true,
            );
          }
          return builder(context);
        },
      ),
    );
  }
}
