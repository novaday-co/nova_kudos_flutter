import 'package:nova_kudos_flutter/src/domain/model/purchase/purchase_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';

abstract class UserRepository{

  Future<ResultModel<UserCompanyModel>> getProfile();

  Future<ResultModel<PurchaseModel>> purchaseProduct(int productId);


}