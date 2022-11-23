import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

@freezed
class LoginPhoneNumberValidationState extends LoginState
    with _$LoginPhoneNumberValidationState {

  const factory LoginPhoneNumberValidationState.valid() =
      LoginValidPhoneNumberState;

  const factory LoginPhoneNumberValidationState.invalid() =
      LoginInValidPhoneNumberState;
}
