import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';

part 'profile_state.freezed.dart';

abstract class ProfileState {}

class InitProfileState extends ProfileState {}

@freezed
class GetProfileRequestState extends ProfileState with _$GetProfileRequestState {
  const factory GetProfileRequestState.loading() = LoadingGetProfileRequestState;

  const factory GetProfileRequestState.success(List<Achievement> achievements) = SuccessGetProfileRequestState;

  const factory GetProfileRequestState.failed(String? error) =
      FailedGetProfileRequestState;
}
