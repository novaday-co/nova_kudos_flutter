import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';
import 'package:nova_kudos_flutter/src/domain/model/transaction_model/transaction_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

part 'pulls_list_state.freezed.dart';


abstract class PullsListState{}

class InitPullsListState extends PullsListState{

}

@freezed
class GetPullsListState extends PullsListState with _$GetPullsListState {
  const factory GetPullsListState.loading() =
  LoadingGetPullsListState;

  const factory GetPullsListState.success(List<PullModel> transactions) =
  SuccessGetPullsListState;

  const factory GetPullsListState.failed(String? error) =
  FailedGetPullsListState;
}

@freezed
class DeletePullsListItemState extends PullsListState with _$DeletePullsListItemState{
  const factory DeletePullsListItemState.loading() =
  LoadingDeletePullsListItemState;

  const factory DeletePullsListItemState.success() =
  SuccessDeletePullsListItemState;

  const factory DeletePullsListItemState.failed(String? error) =
  FailedDeletePullsListItemState;
}
