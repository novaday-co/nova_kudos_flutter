import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';

import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  AuthRepository authRepository = KiwiContainer().resolve<AuthRepository>();
  String phoneNumber = "";

  LoginCubit() : super(LoginInitState());

  void validatePhoneNumber(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const LoginPhoneNumberValidationState.valid());
    }
    if (input?.length == 11) {
      emit(const LoginPhoneNumberValidationState.valid());
    } else {
      emit(const LoginPhoneNumberValidationState.invalid());
    }
  }

  Future<void> postLogin({
    required String phoneNumber,
  }) async {
    emit(const LoginRequestState.loading());
    await safeCall(
      apiCall: authRepository.login(mobileNumber: phoneNumber),
      onSuccess: (resultModel) {
        emit(const LoginRequestState.success());
      },
      onFailed: (failedStatus, error) {
        emit(LoginRequestState.failed(error));
      },
    );
  }
}
