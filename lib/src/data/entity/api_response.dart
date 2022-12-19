import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/main.dart';
import 'package:nova_kudos_flutter/src/data/utils/json_validator.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_snackbars_widget.dart';


class ApiResponse<T> {
  T? data;
  String? message;
  late int statusCode;
  String? error;

  ApiResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  ApiResponse.fromResponse({
    required Response response,
    required T Function(dynamic)? resultMapper,
  }) {
    statusCode = response.statusCode!;
    data = isSuccess ? resultMapper?.call(response.data["data"]) : null;
    error = _extractError(response);
    message = _extractMessage(response);
  }

  bool get isSuccess {
    return statusCode >= 200 && statusCode <= 299;
  }

  bool get isNotFound {
    return statusCode == 404;
  }

  dynamic _extractError(Response<dynamic> response) {
    if (isSuccess) return null;
    Map? errorList;
    String error = "";
    if (response.data.toString().isEmpty) return null;
    if (response.data['error'] != null) {
      errorList = response.data["error"];
      errorList?.forEach((key, value) {
        error += "$value\n";
      });
    }
    return error;
  }

  String? _extractMessage(Response<dynamic> response) {
    if (response.data['message'] != null &&
        response.data['message'] is String) {
      showMessage(response.data['message']);
      return response.data['message'];
    }
    return null;
  }

  void showMessage(String message) {
    if (navigatorKey.currentContext != null) {
      if (isSuccess) {
        KodusSnackBars.showSnackBar(
          snackType: SnackType.success,
          title: message,
          context: navigatorKey.currentContext!,
        );
      } else {
        KodusSnackBars.showSnackBar(
          snackType: SnackType.failure,
          title: message,
          context: navigatorKey.currentContext!,
        );
      }
    }
  }
}
