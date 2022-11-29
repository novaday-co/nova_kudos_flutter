import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_state.freezed.dart';

abstract class VerifyCodeState {}

class InitVerifyCodeState extends VerifyCodeState {}

@freezed
class TimerStates extends VerifyCodeState {
  const factory TimerStates.timeout() = TimerTimeoutState;

  const factory TimerStates.update(int remained) = TimerUpdateState;
}

@freezed
class ResendCodeStates extends VerifyCodeState {
  const factory ResendCodeStates.loading() = LoadingResendCodeState;

  const factory ResendCodeStates.success() = SuccessResendCodeState;

  const factory ResendCodeStates.failed(String? error) = FailedResendCodeState;
}
