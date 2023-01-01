import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/data/api/base_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

abstract class FileApi extends BaseApi {

  Future<ApiResponse> downloadFile({
    required String path,
    required String savePath,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  });

  Future<ApiResponse> uploadFile({
    required String path,
    dynamic bodyParameters,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  });
}
