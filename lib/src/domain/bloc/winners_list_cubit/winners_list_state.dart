import 'package:freezed_annotation/freezed_annotation.dart';

part 'winners_list_state.freezed.dart';

abstract class WinnersListState {}

class InitWinnersListState extends WinnersListState {}

@freezed
class GetWinnersRequestState extends WinnersListState
    with _$GetWinnersRequestState {
  const factory GetWinnersRequestState.loading() =
      LoadingGetWinnersRequestState;

  const factory GetWinnersRequestState.success() =
      SuccessGetWinnersRequestState;

  const factory GetWinnersRequestState.failed(String? error) =
      FailedGetWinnersRequestState;
}
