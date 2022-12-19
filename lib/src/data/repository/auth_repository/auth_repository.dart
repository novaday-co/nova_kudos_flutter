import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';

abstract class AuthRepository {
  Future<ResultModel> login({required String mobileNumber});
}
