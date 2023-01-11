import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headerParameters,
      dynamic bodyParameters,
      ProgressCallback? onSendProgress,
      CancelToken? cancelToken});

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headerParameters});

  Future<Response> download(
    String path,
    String savePath, {
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  });

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    dynamic bodyParameters,
  });

  Future<Response> put(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headerParameters,
      dynamic bodyParameters});

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headerParameters,
      dynamic bodyParameters});
}
