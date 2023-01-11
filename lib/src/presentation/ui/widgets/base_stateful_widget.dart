import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/fab_location.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';

abstract class BaseStatefulWidget<W extends StatefulWidget, C extends Cubit>
    extends StatefulWidget {
  final bool includeHorizontalPadding;
  final bool includeVerticalPadding;
  final bool includeFab;

  const BaseStatefulWidget({
    Key? key,
    this.includeHorizontalPadding = true,
    this.includeVerticalPadding = true,
    this.includeFab = false,
  }) : super(key: key);

  @override
  State<W> createState();
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget,
    C extends Cubit> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<bool> showFab = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    onBuild(context);

    return WillPopScope(
      onWillPop: () async {
        return await onPop.call()?.call() ?? true;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor(context),
        drawer: drawer(),
        floatingActionButton: widget.includeFab ? fabWidget : null,
        floatingActionButtonLocation: DockedRightFabLocation(),
        appBar: appBar(context),
        bottomNavigationBar: bottomWidget(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.includeHorizontalPadding ? 16 : 0,
                vertical: widget.includeVerticalPadding ? 16 : 0),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (widget.includeFab) {
                  if (notification.direction ==
                      ScrollDirection.forward) {
                    showFab.value = true;
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    showFab.value = false;
                  }
                }
                return false;
              },
              child: body(context),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    postFrameCallback(() {
      initialization();
    });
    super.initState();
  }

  void initialization() => {};

  void onBuild(BuildContext context) => {};

  Color? backgroundColor(BuildContext context) => null;

  WillPopCallback? onPop() => null;

  Widget? drawer() => null;

  Widget? bottomWidget() => null;

  String? provideRouteName() => null;

  Widget body(BuildContext context);

  CustomAppbar? appBar(BuildContext context) => null;

  Function? onPageReload(BuildContext context) => null;

  void onFabClick(BuildContext context) => () {};

  C get cubit => context.read<C>();

  Widget get fabWidget {
    return ValueListenableBuilder<bool>(
      valueListenable: showFab,
      builder: (context, show, child) => AnimatedSlide(
        offset: show ? Offset.zero : const Offset(0, 4),
        duration: const Duration(milliseconds: 300),
        child: Builder(
          builder: (context) {
            if (widget.includeFab) {
              return FloatingActionButton(
                mini: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 0,
                child: Center(
                  child: IconWidget(
                    icon: Icons.add,
                    iconColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                onPressed: () {
                  onFabClick(context);
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
