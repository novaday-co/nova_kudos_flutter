import 'dart:async';

import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';

class VerifyCodeCubit extends BaseCubit<VerifyCodeState> {
  late Timer timer;
  String otp = "";

  AuthRepository authRepository = KiwiContainer().resolve<AuthRepository>();

  VerifyCodeCubit() : super(InitVerifyCodeState()) {
    initialTimer();
  }

  void initialTimer() {
    var countDownTime = 60;
    var remainedTime = countDownTime;
    emit(const TimerStates.update(60));
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        remainedTime -= 1;
        if (remainedTime < 0) {
          timer.cancel();
          emit(const TimerStates.timeout());
        } else {
          emit(TimerStates.update(remainedTime));
        }
      },
    );
  }

  void validateVerifyCode(String? input) {
    if (input != null && input.length >= 4) {
      emit(const VerifyCodeValidationState.valid());
    } else {
      emit(const VerifyCodeValidationState.invalid());
    }
  }

  void postVerify({required String phoneNumber, required String otp}) async {
    emit(const LoadingVerifyRequestState());
    await safeCall(
      apiCall: authRepository.verifyOtp(mobileNumber: phoneNumber, otp: otp),
      onSuccess: (resultModel) {
        emit(const VerifyRequestState.success());
      },
      onFailed: (failedStatus, error) {
        emit(VerifyRequestState.failed(error));
      },
    );
  }

  void postResendCode(String mobileNumber) async {
    emit(const LoadingResendCodeRequestState());
    await safeCall(
      apiCall: authRepository.resendOtp(mobileNumber: mobileNumber),
      onSuccess: (resultModel) {
        emit(const ResendCodeRequestStates.success());
        _reset();
      },
      onFailed: (failedStatus, error) {
        emit(ResendCodeRequestStates.failed(error));
      },
    );
  }

  void _reset() {
    timer.cancel();
    initialTimer();
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
