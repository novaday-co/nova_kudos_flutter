import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';

abstract class BaseStatelessWidget<C extends Cubit> extends StatelessWidget {
  final bool fabOnly;
  final bool includeHorizontalPadding;
  final bool includeVerticalPadding;

  const BaseStatelessWidget({
    Key? key,
    this.fabOnly = false,
    this.includeHorizontalPadding = true,
    this.includeVerticalPadding = true,
  }) : super(key: key);


  Future<bool>? onPop(BuildContext context) => null;

  String? provideRouteName() => null;

  Widget body(BuildContext context);

  void onPageReload(BuildContext context) => (){};

  void onBuild(BuildContext context) => (){};

  CustomAppbar? appBar(BuildContext context) => null;

  Color? backgroundColor(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    onBuild(context);
    return WillPopScope(
      onWillPop: () async {
        return (await onPop.call(context)) ?? true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor(context),
        appBar: appBar(context),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: includeHorizontalPadding ? 16 : 0,
              vertical: includeVerticalPadding ? 16 : 0,
            ),
            child: body(context),
          ),
        ),
      ),
    );
  }
}
