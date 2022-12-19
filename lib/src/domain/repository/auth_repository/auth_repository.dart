import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

abstract class AuthRepository {
  Future<ResultModel> login({required String mobileNumber});

  Future<ResultModel<UserModel>> verifyOtp({
    required String mobileNumber,
    required String otp,
  });

  Future<ResultModel> resendOtp({required String mobileNumber});
}
