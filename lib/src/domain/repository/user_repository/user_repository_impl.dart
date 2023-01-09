import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/user_company/user_company_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/account_detail_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi userApi;
  final LocalStorageRepository localStorageRepository;

  UserRepositoryImpl(
      {required this.userApi, required this.localStorageRepository});

  @override
  Future<ResultModel<AccountDetailModel>> getProfile() async {
    final response = await userApi.getProfile();
    if (response.isSuccess) {
      localStorageRepository
          .setUserCompany(response.data?.defaultUserCompany!.mapToModel);
    }
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data!.mapToModel,
    );
  }
}
