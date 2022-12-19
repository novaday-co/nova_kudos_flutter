import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl({
    required this.authApi,
  });

  @override
  Future<ResultModel> login({required String mobileNumber}) async {
    final response = await authApi.login(mobile: mobileNumber);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => null,
    );
  }
}
