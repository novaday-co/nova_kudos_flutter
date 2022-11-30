import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

abstract class ProfileState {}

class InitProfileState extends ProfileState {}

@freezed
class ProfileRequestState extends ProfileState {
  const factory ProfileRequestState.loading() = LoadingProfileRequestState;

  const factory ProfileRequestState.success() = SuccessProfileRequestState;

  const factory ProfileRequestState.failed(String? error) =
      FailedProfileRequestState;
}
