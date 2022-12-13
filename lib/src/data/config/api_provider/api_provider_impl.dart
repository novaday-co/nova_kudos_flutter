import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/config/api_provider/api_provider.dart';

class ApiServiceImpl extends ApiService {

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameter,
        Map<String, dynamic>? headerParameters}) async {
    final dio = KiwiContainer().resolve<Dio>();

    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }

    return await dio.get(
      path,
      queryParameters: queryParameter,
    );
  }

  @override
  Future<Response> download(String path,String savePath,
      {Map<String, dynamic>? queryParameter,
        Map<String, dynamic>? headerParameters}) async {
    final dio = KiwiContainer().resolve<Dio>();

    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }

    return await dio.download(
      path,
      savePath,
      queryParameters: queryParameter,
    );
  }

  @override
  Future<Response> patch(String path,
      {Map<String, dynamic>? queryParameter,
        Map<String, dynamic>? headerParameters,
        dynamic bodyParameters}) async {
    final dio = KiwiContainer().resolve<Dio>();

    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }
    return await dio.patch(
      path,
      queryParameters: queryParameter,
      data: bodyParameters,
    );
  }

  @override
  Future<Response> post(String path, {
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    dynamic bodyParameters,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken
  }) async {
    final dio = KiwiContainer().resolve<Dio>();
    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }
    return await dio.post(
        path,
        queryParameters: queryParameter,
        data: bodyParameters,
        onSendProgress: onSendProgress,
        cancelToken:cancelToken
    );
  }

  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? queryParameter,
        Map<String, dynamic>? headerParameters,
        dynamic bodyParameters}) async {
    final dio = KiwiContainer().resolve<Dio>();

    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }
    return await dio.put(
      path,
      queryParameters: queryParameter,
      data: bodyParameters,
    );
  }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameter,
        Map<String, dynamic>? headerParameters,
        dynamic bodyParameters}) async {
    final dio = KiwiContainer().resolve<Dio>();
    if (headerParameters?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameters!);
    }
    return await dio.delete(path,
        queryParameters: queryParameter, data: bodyParameters);
  }
}
