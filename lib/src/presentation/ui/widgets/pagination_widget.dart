import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_refresher.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginationWidget<ItemType, C extends PaginationCubit<ItemType>>
    extends StatefulWidget {
  final Widget? loadingWidget;
  final Widget Function(List<ItemType>) onData;
  final Widget? onEmpty;
  final Widget? onError;
  final void Function(DeletePaginationItemState<ItemType>)? deleteItemListener;

  const PaginationWidget({
    Key? key,
    this.loadingWidget,
    this.onEmpty,
    this.onError,
    required this.onData,
    this.deleteItemListener,
  }) : super(key: key);

  @override
  State<PaginationWidget> createState() =>
      _PaginationWidgetState<ItemType, C, PaginationWidget<ItemType, C>>();
}

class _PaginationWidgetState<ItemType, C extends PaginationCubit<ItemType>,
    W extends PaginationWidget<ItemType, C>> extends State<W> {
  RefreshController refreshController = RefreshController();
  int pageNumber = 2;

  C get cubit => context.read<C>();

  @override
  Widget build(BuildContext context) {
    return CustomRefresher(
      hasPagination: true,
      controller: refreshController,
      onRefresh: () => cubit.get(requestType: RequestType.refresh),
      onLoading: () =>
          cubit.get(requestType: RequestType.paginate, pageNumber: pageNumber),
      child: BlocConsumer<C, BasePaginationState<ItemType>>(
        buildWhen: _buildWhenPaginationList,
        listener: _listenToPaginationStates,
        builder: (context, state) {
          if (state is PaginationState<ItemType>) {
            return state.when(
              init: () => const SizedBox(),
              loading: (requestType) => isInitializing(requestType)
                  ? widget.loadingWidget ??
                      const Loading(
                        primaryLoading: true,
                      )
                  : widget.onData(cubit.list),
              empty: (requestType) => !isPaginating(requestType)
                  ? emptyView ?? const SizedBox()
                  : widget.onData(cubit.list),
              loaded: (isLastPage, items, currentPage, requestType) =>
                  widget.onData(cubit.list),
              errorOccurred: (message, requestType) =>
                  !isPaginating(requestType)
                      ? widget.onError ?? Text(message ?? "")
                      : const SizedBox(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget get emptyView {
    if (widget.onEmpty != null) return widget.onEmpty!;
    return Center(
      child: TextWidget.bold(
        context.getStrings.noItemFound,
        context: context,
        additionalStyle: const TextStyle(fontSize: 18),
      ),
    );
  }

  bool isRefreshing(RequestType requestType) {
    return requestType == RequestType.refresh;
  }

  bool isPaginating(RequestType requestType) {
    return requestType == RequestType.paginate;
  }

  bool isInitializing(RequestType requestType) {
    return requestType == RequestType.init;
  }

  void resetPageNumber() {
    pageNumber = 2;
  }

  void increasePage() {
    pageNumber++;
  }

  bool _buildWhenPaginationList(BasePaginationState<ItemType> previous,
      BasePaginationState<ItemType> current) {
    return current is PaginationState;
  }

  void _listenToPaginationStates(
      BuildContext context, BasePaginationState<ItemType> state) {
    if (state is PaginationState<ItemType>) {
      state.whenOrNull(
        loaded: (isLastPage, items, currentPage, requestType) {
          if (isRefreshing(requestType)) {
            resetPageNumber();
            refreshController.refreshCompleted();
            refreshController.resetNoData();
          } else if (isPaginating(requestType)) {
            increasePage();
            refreshController.loadComplete();
          }
          if (isLastPage) refreshController.loadNoData();
        },
        empty: (requestType) {
          refreshController.refreshCompleted();
          refreshController.loadNoData();
        },
        errorOccurred: (error, requestType) {
          if (isRefreshing(requestType)) {
            refreshController.refreshFailed();
          } else if (isPaginating(requestType)) {
            refreshController.loadFailed();
          }
        },
      );
    }

    if (state is DeletePaginationItemState<ItemType>) {
      widget.deleteItemListener?.call(state);
      state.whenOrNull(
        success: (index) {
          cubit.items.removeAt(index);
          setState(() {});
        },
      );
    }
  }
}
