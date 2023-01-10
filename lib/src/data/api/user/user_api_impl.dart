import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_collection.dart';

class UserApiImpl extends UserApi {
  @override
  Future<ApiResponse<UserCompanyCollection>> getProfile() async {
    final response = await apiService.get(
      'users/account-detail',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => UserCompanyCollection.fromJson(data),
    );
  }
}
