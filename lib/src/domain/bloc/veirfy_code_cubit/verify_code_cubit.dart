import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  late Timer timer;

  VerifyCodeCubit() : super(InitVerifyCodeState()) {
    loadTimer();
  }

  void loadTimer() {
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

  void postResendCode() async {
    emit(const LoadingResendCodeState());
    await Future.delayed(const Duration(seconds: 2));
    _reset();
    emit(const SuccessResendCodeState());
  }

  void _reset() {
    timer.cancel();
    loadTimer();
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
