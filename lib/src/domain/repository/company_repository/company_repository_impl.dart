import 'package:nova_kudos_flutter/src/data/api/company/company_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/company/product/product_entity.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/company/coin_system/coin_system_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/company/product/product_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/domain/mapper/general/pagination_entity_to_pagination_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/coin/coin_system_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
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
        companyId: companyId, coinValue: coinValue);
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data!.mapToModel,
    );
  }

  @override
  Future<ResultModel<PaginationResourceModel<ProductModel>>> getProducts({
    required int companyId,
    required int pageSize,
    required int pageIndex,
  }) async {
    final response = await companyApi.getCompanyProducts(
      companyId: companyId,
      pageIndex: pageIndex,
      pageSize: pageSize,
    );
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () =>
          response.data!.mapTo<ProductEntity, ProductModel>(
            mapper: (ProductEntity product) => product.mapTo,
          ),
    );
  }

  @override
  Future<ResultModel> deleteProduct({
    required int companyId,
    required int productId,
  }) async {
    final response = await companyApi.deleteProduct(
      companyId: companyId,
      productId: productId,
    );
    return ApiToResultMapper.mapTo(response: response, dataMapper: () => null);
  }
}
