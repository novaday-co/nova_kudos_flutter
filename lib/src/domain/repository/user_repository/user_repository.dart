import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/account_detail_model.dart';

abstract class UserRepository{

  Future<ResultModel<AccountDetailModel>> getProfile();

}