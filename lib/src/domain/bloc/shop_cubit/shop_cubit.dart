import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';

class ShopCubit extends PaginationCubit<ProductModel> {
  CompanyRepository companyRepository;
  LocalStorageRepository localStorageRepository;

  ShopCubit({
    required this.companyRepository,
    required this.localStorageRepository,
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
      onData: (resultStatus, resultModel) {
        emitLoaded(
          PaginationResourceModel<ProductModel>(
            data: resultModel!.data!.data,
            meta: resultModel.data?.meta,
          ),
          requestType,
        );
      },
    );
  }
}
