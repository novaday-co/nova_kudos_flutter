import 'package:nova_kudos_flutter/src/domain/model/company/coin/coin_system_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

abstract class CompanyRepository {
  Future<ResultModel<CompanyCoinSystemModel>> getCompanyCoinValue({
    required int companyId,
  });

  Future<ResultModel<CompanyCoinSystemModel>> setCompanyCoinValue(
      {required int companyId, required int coinValue});

  Future<ResultModel<PaginationResourceModel<ProductModel>>> getProducts({
    required int companyId,
    required int pageSize,
    required int pageIndex,
  });

  Future<ResultModel> deleteProduct({
    required int companyId,
    required int productId,
  });
}
