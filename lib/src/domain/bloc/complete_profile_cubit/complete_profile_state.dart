import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_profile_state.freezed.dart';

abstract class CompleteProfileState {}

class CompleteProfileInitState extends CompleteProfileState {}

@freezed
class CompleteProfileFormValidationState extends CompleteProfileState {
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
class CompleteProfilePictureState extends CompleteProfileState
    with _$CompleteProfilePictureState {
  const factory CompleteProfilePictureState.selected(String imagePath) =
      SelectCompleteProfilePictureState;
}
