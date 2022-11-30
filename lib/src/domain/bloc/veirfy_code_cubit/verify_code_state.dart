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
class VerifyCodeValidationState extends VerifyCodeState {
  const factory VerifyCodeValidationState.valid() =
  VerifyCodeValidValidationState;

  const factory VerifyCodeValidationState.invalid() =
  VerifyCodeInValidValidationState;
}

@freezed
class ResendCodeRequestStates extends VerifyCodeState {
  const factory ResendCodeRequestStates.loading() = LoadingResendCodeRequestState;

  const factory ResendCodeRequestStates.success() = SuccessResendCodeRequestState;

  const factory ResendCodeRequestStates.failed(String? error) = FailedResendCodeRequestState;
}

@freezed
class VerifyRequestState extends VerifyCodeValidValidationState {
  const factory VerifyRequestState.loading() = LoadingVerifyRequestState;

  const factory VerifyRequestState.success() = SuccessVerifyRequestState;

  const factory VerifyRequestState.failed(String? error) =
  FailedVerifyRequestState;
}
