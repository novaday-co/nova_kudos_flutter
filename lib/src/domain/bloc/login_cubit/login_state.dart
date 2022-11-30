import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';


abstract class LoginState {}

class LoginInitState extends LoginState {}

@freezed
class LoginPhoneNumberValidationState extends LoginState {
  const factory LoginPhoneNumberValidationState.valid() =
      LoginValidPhoneNumberState;

  const factory LoginPhoneNumberValidationState.invalid() =
      LoginInValidPhoneNumberState;
}

@freezed
class LoginRequestState extends LoginValidPhoneNumberState {
  const factory LoginRequestState.loading() = LoadingLoginRequestState;

  const factory LoginRequestState.success() = SuccessLoginRequestState;

  const factory LoginRequestState.failed(String? error) =
      FailedLoginRequestState;
}
