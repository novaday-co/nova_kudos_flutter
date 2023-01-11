import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';

part 'complete_profile_state.freezed.dart';

abstract class CompleteProfileStates extends BaseFileState {}

class CompleteProfileInitState extends CompleteProfileStates {}

@freezed
class CompleteProfileGetUserState extends CompleteProfileStates
    with _$CompleteProfileGetUserState {
  const factory CompleteProfileGetUserState.loading() =
      LoadingCompleteProfileGetUserState;

  const factory CompleteProfileGetUserState.success() =
      SuccessCompleteProfileGetUserState;
}

@freezed
class CompleteProfileFormValidationState extends CompleteProfileStates {

  const factory CompleteProfileFormValidationState.valid() =
      CompleteProfileValidFormState;

  const factory CompleteProfileFormValidationState.invalid() =
      CompleteProfileInValidFormState;
}

@freezed
class ChangePhoneProfileState extends CompleteProfileStates
    with _$ChangePhoneProfileState {
  const factory ChangePhoneProfileState.loading() =
      LoadingChangePhoneProfileState;

  const factory ChangePhoneProfileState.success() =
      SuccessChangePhoneProfileState;

  const factory ChangePhoneProfileState.failed(String? error) =
      FailedChangePhoneProfileState;
}
