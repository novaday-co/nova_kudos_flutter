import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/data/api/file/file_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

class FileApiImpl extends FileApi {
  @override
  Future<ApiResponse<String>> downloadFile({
    required String path,
    required String savePath,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    final response = await apiService.download(
      path,
      savePath,
      queryParameter: queryParameter,
      headerParameters: headerParameters,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );

    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => savePath,
    );
  }

  @override
  Future<ApiResponse> uploadFile({
    required String path,
    dynamic bodyParameters,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final response = await apiService.post(
      path,
      bodyParameters: bodyParameters,
      queryParameter: queryParameter,
      headerParameters: headerParameters,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );

    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => null,
    );
  }
}
