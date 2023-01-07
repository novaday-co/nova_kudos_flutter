import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/data/utils/exception.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

class BaseCubit<T> extends Cubit<T> {
  BaseCubit(T initialState) : super(initialState);

  Future<void> safeCall<D>({
    required Future<ResultModel<D>> apiCall,
    Function(String?)? onError,
    required Function(ResultStatus, ResultModel<D>?) onData,
  }) async {
    try {
      final response = await apiCall;
      if (response.isFailure) {
        onError?.call(response.error);
      }
      else{
        onData.call(response.status, response);
      }
    } on DioError catch (error) {
      if (error.error is KodusException) {
        addError(error.error);
        onError?.call(error.error.toString());
      } else {
        onError?.call(error.message);
      }
    }
  }

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
