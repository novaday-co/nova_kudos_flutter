import 'dart:async';

import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';

class VerifyCodeCubit extends BaseCubit<VerifyCodeState> {
  late Timer timer;
  String otp = "";

  AuthRepository authRepository;
  UserRepository userRepository;

  VerifyCodeCubit({
    required this.userRepository,
    required this.authRepository,
  }) : super(InitVerifyCodeState()) {
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

  void postVerify({
    required String phoneNumber,
    required String otp,
    required bool isEdit,
  }) async {
    emit(const LoadingVerifyRequestState());
    await safeCall(
      apiCall: isEdit
          ? userRepository.postVerifyMobile(mobile: phoneNumber, otpCode: otp)
          : authRepository.verifyOtp(mobileNumber: phoneNumber, otp: otp),
      onData: (resultModel) {
        emit(const VerifyRequestState.success());
      },
      onError: (failedStatus, error) {
        emit(VerifyRequestState.failed(error));
      },
    );
  }

  void postResendCode(String mobileNumber) async {
    emit(const LoadingResendCodeRequestState());
    await safeCall(
      apiCall: authRepository.resendOtp(mobileNumber: mobileNumber),
      onData: (resultModel) {
        emit(const ResendCodeRequestStates.success());
        _reset();
      },
      onError: (failedStatus, error) {
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
