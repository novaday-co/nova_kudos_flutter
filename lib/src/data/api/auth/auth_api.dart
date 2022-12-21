import 'package:nova_kudos_flutter/src/data/api/base_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_entity/user_entity.dart';

abstract class AuthApi extends BaseApi {
  Future<ApiResponse> login({
    required String mobile,
  });

  Future<ApiResponse> logout();

  Future<ApiResponse<UserEntity>> verifyOtp({
    required String mobileNumber,
    required String otp,
  });

  Future<ApiResponse> resendOtp({
    required String mobile,
  });
}
