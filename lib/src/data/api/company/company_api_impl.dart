import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

import 'package:nova_kudos_flutter/src/data/entity/company/coin/coin_system_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/company/product/product_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/general/paging_resource_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';

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

  @override
  Future<ApiResponse<CoinSystemEntity>> setCompanyCoinValue({
    required int companyId,
    required int coinValue,
  }) async {
    final response = await apiService.post(
      'companies/$companyId/set/coin',
      bodyParameters: {'coin_value': coinValue},
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => CoinSystemEntity.fromJson(data),
    );
  }

  @override
  Future<ApiResponse<PaginationResourceEntity<ProductEntity>>>
      getCompanyProducts({
    required int companyId,
    required int pageSize,
    required int pageIndex,
  }) async {
    final response = await apiService
        .get('companies/$companyId/market/products', queryParameter: {
      "page": pageIndex,
      "query_count": pageSize,
    });
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => PaginationResourceEntity.fromJson(
          response.data, (data) => ProductEntity.fromJson(data)),
    );
  }

  @override
  Future<ApiResponse> deleteProduct({
    required int companyId,
    required int productId,
  }) async {
    final response = await apiService.delete(
      'companies/$companyId/market/products/$productId',
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => null,
    );
  }

  @override
  Future<ApiResponse> postNewProduct({
    required int companyId,
    required ProductModel productModel,
    ProgressCallback? onSendProgress,
  }) async {
    FormData body = FormData.fromMap(
      {
        "avatar": productModel.avatar != null
            ? await MultipartFile.fromFile(
                productModel.avatar ?? '',
                filename: productModel.avatar?.split('/').last,
              )
            : null,
        "name": productModel.name,
        "currency": productModel.currency,
        "amount": productModel.amount,
        "expiration_date": "2023-11-03",
      },
    );
    final response = await apiService.post(
      'companies/$companyId/market/products',
      bodyParameters: body,
      onSendProgress: onSendProgress
    );
    return ApiResponse.fromResponse(
      response: response,
      resultMapper: (data) => data,
    );
  }
}
