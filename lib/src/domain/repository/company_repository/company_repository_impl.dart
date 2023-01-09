import 'package:nova_kudos_flutter/src/data/api/company/company_api.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/company/coin_system/coin_system_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/coin_system_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyApi companyApi;

  CompanyRepositoryImpl({
    required this.companyApi,
  });

  @override
  Future<ResultModel<CompanyCoinSystemModel>> getCompanyCoinValue({
    required int companyId,
  }) async {
    final response = await companyApi.getCompanyCoinValue(companyId: companyId);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data!.mapToModel,
    );
  }

  @override
  Future<ResultModel<CompanyCoinSystemModel>> setCompanyCoinValue({
    required int companyId,
    required int coinValue,
  }) async {
    final response = await companyApi.setCompanyCoinValue(
      companyId: companyId,
      coinValue: coinValue
    );
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data!.mapToModel,
    );
  }
}
