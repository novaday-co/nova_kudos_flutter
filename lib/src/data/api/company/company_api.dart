import 'package:nova_kudos_flutter/src/data/api/base_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/company/coin/coin_system_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/company/product/product_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/general/paging_resource_entity.dart';

abstract class CompanyApi extends BaseApi {
  Future<ApiResponse<CoinSystemEntity>> getCompanyCoinValue({
    required int companyId,
  });

  Future<ApiResponse<CoinSystemEntity>> setCompanyCoinValue({
    required int companyId,
    required int coinValue
  });

  Future<ApiResponse<PaginationResourceEntity<ProductEntity>>> getCompanyProducts({
    required int companyId,
    required int pageSize,
    required int pageIndex,
  });
}
