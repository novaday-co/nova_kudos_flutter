enum ResultStatus {
  success,
  failure
}

enum FailedResultStatus { badRequest, notFound }

class ResultModel<D> {
  D? data;
  String? message;
  ResultStatus status;
  FailedResultStatus? failedStatus;
  String? error;
  int? statusCode;

  ResultModel({
    this.data,
    this.message,
    this.error,
    this.status = ResultStatus.success,
    this.statusCode,
    this.failedStatus,
  });

  bool get isSuccess {
    return status == ResultStatus.success;
  }

  bool get isFailure {
    return status == ResultStatus.failure;
  }

  bool get isNotFound {
    return failedStatus == FailedResultStatus.notFound;
  }
}
