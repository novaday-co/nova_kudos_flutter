import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';

class ShopCubit extends PaginationCubit<ProductModel> {
  CompanyRepository companyRepository;

  ShopCubit({
    required this.companyRepository,
  }) : super();

  @override
  Future<void> get({
    RequestType requestType = RequestType.init,
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    emitLoading(requestType);
    UserCompanyModel defaultCompany = await localStorageRepository.getUser();

    await safeCall(
      apiCall: companyRepository.getProducts(
        companyId: defaultCompany.companyId!,
        pageSize: pageSize,
        pageIndex: pageNumber,
      ),
      onSuccess: (resultModel) {
        emitLoaded(
          PaginationResourceModel<ProductModel>(
            data: resultModel!.data!.data,
            meta: resultModel.data?.meta,
          ),
          requestType,
        );
      },
      onFailed: (resultStatus, error) {
        emitError(requestType, message: error);
      },
    );
  }

  Future<void> deleteProduct(int index) async {
    emit(DeletePaginationItemState.loading());
    await safeCall(
      apiCall: companyRepository.deleteProduct(
        companyId: (await defaultCompany).companyId ?? -1,
        productId: list[index].id ?? -1,
      ),
      onSuccess: (result) {
        emit(DeletePaginationItemState.success(index));
      },
      onFailed: (failedStatus, error) {
        emit(DeletePaginationItemState.failed(error));
      },
    );
  }
}
