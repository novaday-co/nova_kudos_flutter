import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/user/user_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;
  final LocalStorageRepository localStorageRepository;

  AuthRepositoryImpl(
      {required this.authApi, required this.localStorageRepository});

  @override
  Future<ResultModel> login({required String mobileNumber}) async {
    final response = await authApi.login(mobile: mobileNumber);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => null,
    );
  }

  @override
  Future<ResultModel> logout() async {
    final response = await authApi.logout();
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => null,
    );
  }

  @override
  Future<ResultModel<UserModel>> verifyOtp(
      {required String mobileNumber, required String otp}) async {
    final response =
        await authApi.verifyOtp(mobileNumber: mobileNumber, otp: otp);
    if (response.isSuccess) {
      localStorageRepository.setUser(response.data!.mapToModel);
      localStorageRepository.setToken(response.data!.token!);
    }
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data!.mapToModel,
    );
  }

  @override
  Future<ResultModel> resendOtp({required String mobileNumber})async {
    final response = await authApi.resendOtp(mobile: mobileNumber);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => null,
    );
  }
}
