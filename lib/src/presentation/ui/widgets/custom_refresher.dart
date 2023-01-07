import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresher extends StatelessWidget {
  final RefreshController controller;
  final Function()? onRefresh;
  final Function()? onLoading;
  final ScrollController? scrollController;
  final bool hasPagination;
  final bool reverse;
  final Widget child;

  const CustomRefresher({
    Key? key,
    required this.controller,
    required this.onRefresh,
    this.onLoading,
    required this.child,
    this.hasPagination = false,
    this.reverse = false,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => ClassicHeader(
        releaseText: context.getStrings.releaseToLoad,
        idleText: context.getStrings.pullToLoad,
        completeText: context.getStrings.refreshComplete,
        refreshingText: context.getStrings.loading,
        textStyle: Styles.bodyText1(context).copyWith(
          color: Theme.of(context).colorScheme.onTertiary,
          fontSize: 12
        ),
        completeIcon: Icon(
          Icons.done,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        idleIcon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        releaseIcon: Icon(
          Icons.refresh,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        refreshingIcon: const Loading(
          primaryLoading: true,
          width: 20,
          height: 20,
        ),
        iconPos: IconPosition.left,
      ),
      child: SmartRefresher(
        controller: controller,
        scrollController: scrollController,
        reverse: reverse,
        primary: scrollController != null ? false : true,
        dragStartBehavior: DragStartBehavior.down,
        footer: ClassicFooter(
          canLoadingText: context.getStrings.releaseToLoad,
          idleText: context.getStrings.pullToLoad,
          loadingText: context.getStrings.loading,
          noDataText: context.getStrings.loadingComplete,
          loadingIcon: const Loading(
            primaryLoading: true,
          ),
          completeDuration: const Duration(seconds: 1),
          iconPos: IconPosition.left,
        ),
        // CustomFooter(
        //   builder: (context, mode) {
        //     return DarmanitoLoading(loading: true);
        //   },
        // ),
        enableTwoLevel: onRefresh != null,
        enablePullUp: hasPagination,
        enablePullDown: onRefresh != null,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child,
      ),
    );
  }
}
