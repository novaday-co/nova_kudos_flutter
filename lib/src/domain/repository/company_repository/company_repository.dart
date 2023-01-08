import 'package:nova_kudos_flutter/src/domain/model/company/coin_system_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

abstract class CompanyRepository {
  Future<ResultModel<CompanyCoinSystemModel>> getCompanyCoinValue({
    required int companyId,
  });

  Future<ResultModel<CompanyCoinSystemModel>> setCompanyCoinValue({
    required int companyId,
    required int coinValue
  });
}
