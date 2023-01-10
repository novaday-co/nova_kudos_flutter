import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';

part 'complete_profile_state.freezed.dart';


class CompleteProfileInitState extends BaseFileState {}

@freezed
class CompleteProfileGetUserState extends BaseFileState with _$CompleteProfileGetUserState {
  const factory CompleteProfileGetUserState.loading() =
  LoadingCompleteProfileGetUserState;

  const factory CompleteProfileGetUserState.success() =
  SuccessCompleteProfileGetUserState;
}

@freezed
class CompleteProfileFormValidationState extends BaseFileState {
  const factory CompleteProfileFormValidationState.valid() =
      CompleteProfileValidFormState;

  const factory CompleteProfileFormValidationState.invalid() =
      CompleteProfileInValidFormState;
}

@freezed
class CompleteProfileRequestState extends CompleteProfileValidFormState {
  const factory CompleteProfileRequestState.loading() =
      LoadingCompleteProfileRequestState;

  const factory CompleteProfileRequestState.success() =
      SuccessCompleteProfileRequestState;

  const factory CompleteProfileRequestState.failed(String? error) =
      FailedCompleteProfileRequestState;
}

@freezed
class CompleteProfilePictureState extends BaseFileState
    with _$CompleteProfilePictureState {
  const factory CompleteProfilePictureState.selected(String imagePath) =
      SelectCompleteProfilePictureState;
}
