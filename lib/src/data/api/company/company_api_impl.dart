import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

import 'package:nova_kudos_flutter/src/data/entity/company/coin_system_entity.dart';

import 'company_api.dart';

class CompanyApiImpl extends CompanyApi {
  @override
  Future<ApiResponse<CoinSystemEntity>> getCompanyCoinValue({
    required int companyId,
  }) async {
    final response = await apiService.get(
      'companies/$companyId/coin/system',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => CoinSystemEntity.fromJson(data),
    );
  }
}
