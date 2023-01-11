import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';

class ShopCubit extends PaginationCubit<ProductModel> {
  CompanyRepository companyRepository;
  UserRepository userRepository;

  ShopCubit({
    required this.companyRepository,
    required this.userRepository,
  }) : super(){
    getUser();
  }

  UserCompanyModel? userCompanyModel;

  void getUser()async{
    emit(const GetUserState.loading());
    userCompanyModel=await defaultCompany;
    emit(const GetUserState.success());

  }

  @override
  Future<void> get({
    RequestType requestType = RequestType.init,
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    emitLoading(requestType);

    await safeCall(
      apiCall: companyRepository.getProducts(
        companyId: (await defaultCompany).companyId ?? -1,
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

  Future<void> postPurchaseProduct(int productId) async {
    emit(const PurchaseRequestState.loading());
    await safeCall(
      apiCall: userRepository.purchaseProduct(productId),
      onSuccess: (response) async {
        await safeCall(
          apiCall: userRepository.getProfile(),
          onSuccess: (profileResponse)async {
            userCompanyModel=await defaultCompany;
            emit(PurchaseRequestState.success(response!.data!));

          },
        );
      },
      onFailed: (resultStatus, error) {
        emit(PurchaseRequestState.failed(error));
      },
    );
  }
}
