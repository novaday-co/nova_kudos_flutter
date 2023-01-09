import 'package:nova_kudos_flutter/src/data/api/base_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_collection.dart';

abstract class UserApi extends BaseApi{

   Future<ApiResponse<UserCompanyCollection>> getProfile();

}