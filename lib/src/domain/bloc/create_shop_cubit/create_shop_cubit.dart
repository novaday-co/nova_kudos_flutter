import 'dart:io';

import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';

class CreateShopCubit extends FileCubit<CreateShopState> {
  CompanyRepository companyRepository;
  ProductModel productModel = ProductModel();

  CreateShopCubit({
    required this.companyRepository,
  }) : super(InitCreateShopState());


  Future<void> postNewProduct() async {
    emitUploading();
    UserCompanyModel userCompanyModel = await defaultCompany;
    await safeCall(
      apiCall: companyRepository.postNewProduct(
          companyId: userCompanyModel.companyId ?? -1,
          productModel: productModel,
          onSendProgress: onSendProgress
      ),
      onSuccess: (result) {
        emitSuccessUploading();
      },
      onFailed: (failedStatus, error) {
        emitFailedUploading(error);
      },
    );  }

  void checkFormValidation() {
    if (productModel.name != null &&
        productModel.currency != null &&
        productModel.amount != null) {
      if (productModel.name!.isNotEmpty &&
          productModel.currency!.toString().isNotEmpty &&
          productModel.amount!.toString().isNotEmpty) {
        emit(const CreateProductFormValidationState.valid());
      } else {
        emit(const CreateProductFormValidationState.invalid());
      }
    } else {
      emit(const CreateProductFormValidationState.invalid());
    }
  }

  void setProductName(String name) {
    productModel.name = name;
    checkFormValidation();
  }

  void setProductAmount(String amount) {
    if (amount.toString().isNotEmpty) {
      productModel.amount = int.parse(amount);
    } else {
      productModel.amount = null;
    }
    checkFormValidation();
  }

  void setProductValue(String currency) {
    if (currency.toString().isNotEmpty) {
      productModel.currency = int.parse(currency);
    } else {
      productModel.currency = null;
    }
    checkFormValidation();
  }

  setProductImage(File image) => productModel.avatar = image.path;
}
