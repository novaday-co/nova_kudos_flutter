import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  void validatePhoneNumber(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const LoginPhoneNumberValidationState.valid());
    } else {
      emit(const LoginPhoneNumberValidationState.invalid());
    }
  }

  Future<void> postLogin({
    required String phoneNumber,
  }) async {
    emit(const LoginRequestState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoginRequestState.success());
  }
}
