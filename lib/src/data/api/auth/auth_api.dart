import 'package:nova_kudos_flutter/src/data/api/base_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';

abstract class AuthApi extends BaseApi {
  Future<ApiResponse> login({
    required String mobile,
  });
}
