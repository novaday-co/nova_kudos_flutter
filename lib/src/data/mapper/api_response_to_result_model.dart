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
      statusCode: response.statusCode,
      status: _getStatusCode(response),
      failedStatus: _getFailedStatus(response)
    );
  }

  static ResultStatus _getStatusCode(ApiResponse response) {
    if (response.isSuccess) {
      return ResultStatus.success;
    }
    return ResultStatus.failure;
  }

  static FailedResultStatus? _getFailedStatus(ApiResponse response) {
    if (response.isNotFound) {
      return FailedResultStatus.notFound;
    }
    return null;
  }
}
