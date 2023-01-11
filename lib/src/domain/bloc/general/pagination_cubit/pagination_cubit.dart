import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';

import 'pagination_state.dart';

enum RequestType { refresh, paginate, init }

abstract class PaginationCubit<D> extends BaseCubit<BasePaginationState<D>> {
  PaginationCubit() : super(PaginationState.init());
  List<D> items = [];

  List<D> get list => items;

  emitLoading(RequestType requestType) =>
      emit(PaginationState.loading(requestType));

  emitLoaded(PaginationResourceModel<D> data, RequestType requestType) {
    if (requestType == RequestType.paginate) {
      items.addAll(data.data);
    } else {
      items = data.data;
    }
    bool isLastPage = data.meta?.isLastPage() ?? false;

    if(requestType != RequestType.paginate && list.isEmpty){
      emitEmpty(requestType);
    }
    else{
      emit(
        PaginationState.loaded(
            isLastPage: isLastPage,
            items: list,
            currentPage: data.meta!.currentPage,
            requestType: requestType),
      );
    }
  }

  emitEmpty(RequestType requestType, {String? message}) {
    emit(PaginationState.empty(requestType));
  }

  emitError(RequestType requestType, {String? message}) {
    emit(PaginationState.errorOccurred(message, requestType));
  }



  Future<void> get({
    RequestType requestType = RequestType.init,
    int pageNumber = 1,
    int pageSize = 20,
  });
}
