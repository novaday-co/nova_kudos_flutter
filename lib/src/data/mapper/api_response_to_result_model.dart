import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

class ApiToResultMapper {
  static ResultModel<T> mapTo<T>({
    required ApiResponse response,
    required T Function()? dataMapper,
  }) {
    return ResultModel(
      data: response.isSuccess ? dataMapper?.call() : null,
      message: response.message,
      error: response.error,
      status: _getStatusCode(response),
    );
  }

  static ResultStatus _getStatusCode(ApiResponse response) {
    if (response.isSuccess) {
      return ResultStatus.success;
    }
    if (response.isNotFound) {
      return ResultStatus.notFound;
    }
    return ResultStatus.failure;
  }
}
