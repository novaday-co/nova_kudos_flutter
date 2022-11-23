import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar_widget.dart';

abstract class BaseStatefulWidget<W extends StatefulWidget>
    extends StatefulWidget {
  final bool includeHorizontalPadding;
  final bool includeVerticalPadding;

  const BaseStatefulWidget({
    Key? key,
    this.includeHorizontalPadding = true,
    this.includeVerticalPadding = true,
  }) : super(key: key);

  @override
  State<W> createState();
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget>
    extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    onBuild(context);

    return WillPopScope(
      onWillPop: () async {
        return await onPop.call()?.call() ?? true;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer(),
        appBar: appBar(context),
        bottomNavigationBar: bottomNavigation(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.includeHorizontalPadding ? 16:0,
              vertical: widget.includeVerticalPadding ? 16:0
            ),
            child: body(context),
          ),
        ),
      ),
    );
  }

  Function? onBuild(BuildContext context) => null;

  WillPopCallback? onPop() => null;

  Widget? drawer() => null;

  Widget? bottomNavigation() => null;

  String? provideRouteName() => null;

  Widget body(BuildContext context);

  CustomAppbar? appBar(BuildContext context) => null;

  Function? onPageReload(BuildContext context) => null;
}
