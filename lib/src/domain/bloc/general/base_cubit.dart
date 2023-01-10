import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/utils/exception.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';

class BaseCubit<T> extends Cubit<T> {
  BaseCubit(T initialState) : super(initialState);

  LocalStorageRepository localStorageRepository =
      KiwiContainer().resolve<LocalStorageRepository>();

  Future<void> safeCall<D>({
    required Future<ResultModel<D>> apiCall,
    Function(FailedResultStatus?, String?)? onFailed,
    Function(ResultModel<D>?)? onSuccess,
  }) async {
    try {
      final response = await apiCall;
      if (response.isFailure) {
        onFailed?.call(response.failedStatus, response.error);
      } else {
        onSuccess?.call(response);
      }
    } on DioError catch (error) {
      if (error.error is KodusException) {
        addError(error.error);
        onFailed?.call(null, error.error.toString());
      } else {
        onFailed?.call(null, error.message);
      }
    }
  }

  Future<UserCompanyModel> get defaultCompany async =>
      await localStorageRepository.getUser();

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
