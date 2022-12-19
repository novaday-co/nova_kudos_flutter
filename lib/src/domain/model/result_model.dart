enum ResultStatus { success, failure ,notFound }

class ResultModel<D> {
  D? data;
  String? message;
  ResultStatus status;
  String? error;
  int? statusCode;

  ResultModel({
    this.data,
    this.message,
    this.error,
    this.status = ResultStatus.success,
    this.statusCode,
  });

  bool get isSuccess {
    return status == ResultStatus.success;
  }

  bool get isFailure {
    return status == ResultStatus.failure;
  }

  bool get isNotFound {
    return status == ResultStatus.notFound;
  }

}
