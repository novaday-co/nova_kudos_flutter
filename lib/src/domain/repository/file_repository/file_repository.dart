import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

abstract class FileRepository {
  Future<ResultModel> upload({
    required String url,
    dynamic bodyParameters,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  });

  Future<ResultModel> download({
    required String url,
    String? savePath,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  });
}
