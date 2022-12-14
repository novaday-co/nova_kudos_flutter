import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

part 'members_state.freezed.dart';

abstract class MembersState {}

class InitMembersState extends MembersState {}

@freezed
class GetMembersState extends MembersState with _$GetMembersState {
  const factory GetMembersState.loading() =
  LoadingGetMembersState;

  const factory GetMembersState.success(List<UserModel> members) =
  SuccessGetMembersState;

  const factory GetMembersState.failed(String? error) =
  FailedGetMembersState;
}

@freezed
class DeleteMembersState extends MembersState with _$DeleteMembersState{
  const factory DeleteMembersState.loading() =
  LoadingDeleteMembersState;

  const factory DeleteMembersState.success() =
  SuccessDeleteMembersState;

  const factory DeleteMembersState.failed(String? error) =
  FailedDeleteMembersState;
}
