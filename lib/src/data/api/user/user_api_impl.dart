import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_entity.dart';

class UserApiImpl extends UserApi {
  @override
  Future<ApiResponse<UserCompanyEntity>> getProfile() async {
    final response = await apiService.get(
      'users/account-detail',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => UserCompanyEntity.fromJson(data),
    );
  }

  @override
  Future<ApiResponse> postChangeMobile({
    required String mobile,
  }) async {
    final response =
        await apiService.post('users/change-mobile', bodyParameters: {
      "mobile": mobile,
    });
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => data,
    );
  }

  @override
  Future<ApiResponse> postVerifyMobile({
    required String mobile,
    required String otpCode,
  }) async {
    final response =
        await apiService.post('users/verify-mobile', bodyParameters: {
      "mobile": mobile,
      "otp_code": otpCode,
    });
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => data,
    );
  }
}
