import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_entity/user_entity.dart';

class AuthApiImpl extends AuthApi {
  @override
  Future<ApiResponse> login({required String mobile}) async {
    final response = await apiService.post(
      'authentication/login',
      bodyParameters: {'mobile': mobile},
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => null,
    );
  }

  @override
  Future<ApiResponse> logout() async {
    final response = await apiService.post(
      'authentication/logout',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => null,
    );
  }

  @override
  Future<ApiResponse<UserEntity>> verifyOtp(
      {required String mobileNumber, required String otp}) async {
    final response = await apiService.post(
      'authentication/check-otp',
      bodyParameters: {'mobile': mobileNumber, 'otp_code': otp},
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => UserEntity.fromJson(data),
    );
  }

  @override
  Future<ApiResponse> resendOtp({required String mobile})async {
    final response = await apiService.post(
      'authentication/resend-otp',
      bodyParameters: {'mobile': mobile},
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => null,
    );
  }
}
