import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

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
}
