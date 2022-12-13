import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive.dart';
import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper_actions.dart';
import 'package:nova_kudos_flutter/src/data/utils/exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const bool isDev = String.fromEnvironment("BUILD_TYPE") == "DEV";

class DioWrapper {
  static Dio provide() {
    final dio = Dio();
    dio.interceptors.add(_getResponseInterceptor());
    dio.interceptors.add(_getLoggerInterceptor());
    return dio;
  }

  static QueuedInterceptor _getResponseInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    );
  }

  static void _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final hive = KiwiContainer().resolve<MyHive>();
    final keeper = KiwiContainer().resolve<KeeperActions>();
    options.headers["Accept"] = "application/json";
    options.headers["Content-type"] = "application/json";
    options.headers["locale"] = (await hive.getPreferences())?.language;
    options.headers["Authorization"] = "Bearer ${await keeper.getToken()}";
    return handler.next(options);
  }

  static void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  static void _onError(
      DioError options, ErrorInterceptorHandler handler) async {
    if (options.error is SocketException) {
      handler.reject(DioError(requestOptions: options.requestOptions));
    }
    switch (options.response?.statusCode) {
      case HttpStatus.forbidden:
        return handler.reject(
          DioError(
            requestOptions: options.requestOptions,
            error: AccessDeniedException(message: options.message),
          ),
        );
      case HttpStatus.notFound:
        return handler.reject(
          DioError(
            requestOptions: options.requestOptions,
            error: NotFoundException(message: options.message),
          ),
        );
      case 413:
        return handler.reject(
          DioError(
            requestOptions: options.requestOptions,
            error: UnauthorizedException(message: options.message),
          ),
        );
      case HttpStatus.unprocessableEntity:
        return handler.reject(
          DioError(
            requestOptions: options.requestOptions,
            error: UnProcessableEntityException(message: options.message),
          ),
        );
      case HttpStatus.internalServerError:
        return handler.reject(
          DioError(
            requestOptions: options.requestOptions,
            error: ServerError(message: options.message),
          ),
        );
      default:
        return handler.resolve(options.response!);
    }
  }



  static PrettyDioLogger _getLoggerInterceptor() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: true,
        maxWidth: 150);
  }
}
