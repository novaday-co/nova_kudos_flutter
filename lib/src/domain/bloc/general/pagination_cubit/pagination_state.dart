import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';

part 'pagination_state.freezed.dart';

abstract class BasePaginationState<D> {}

@freezed
class PaginationState<D> extends BasePaginationState<D>
    with _$PaginationState<D> {
  factory PaginationState.init() = InitPaginationState;

  factory PaginationState.loading(RequestType requestType) =
      LoadingPaginationState;

  factory PaginationState.empty(RequestType requestType) = EmptyPaginationState;

  factory PaginationState.loaded(
      {required bool isLastPage,
      required List<D> items,
      required int currentPage,
      required RequestType requestType}) = LoadedPaginationState;

  factory PaginationState.errorOccurred(
      String? message, RequestType requestType) = ErrorOccurredPaginationState;
}

@freezed
class DeletePaginationItemState<D> extends BasePaginationState<D>
    with _$DeletePaginationItemState<D> {
  factory DeletePaginationItemState.loading() =
      LoadingDeletePaginationItemState;

  factory DeletePaginationItemState.success(int index) =
      SuccessDeletePaginationItem;

  factory DeletePaginationItemState.failed(String? message) =
      FailedDeletePaginationItem;
}
