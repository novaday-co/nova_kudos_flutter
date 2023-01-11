import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/purchase/purchase_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_collection.dart';
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
  Future<ApiResponse<PurchaseEntity>> purchaseProduct(int productId,)async {
    final response = await apiService.post(
      'users/products/$productId',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => PurchaseEntity.fromJson(data),
    );
  }
}
