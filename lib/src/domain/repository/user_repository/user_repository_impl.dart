import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/user_company/user_company_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi userApi;
  final LocalStorageRepository localStorageRepository;

  UserRepositoryImpl(
      {required this.userApi, required this.localStorageRepository});

  @override
  Future<ResultModel<UserCompanyModel>> getProfile() async {
    final response = await userApi.getProfile();
    if (response.isSuccess) {
      localStorageRepository
          .setUserCompany(response.data?.mapToModel);
    }
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data?.mapToModel,
    );
  }

  @override
  Future<ResultModel> postChangeMobile({
    required String mobile,
  }) async {
    final response = await userApi.postChangeMobile(mobile: mobile);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data,
    );
  }

  @override
  Future<ResultModel> postVerifyMobile({
    required String mobile,
    required String otpCode,
  }) async {
    final response = await userApi.postVerifyMobile(mobile: mobile, otpCode: otpCode);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data,
    );
  }
}
