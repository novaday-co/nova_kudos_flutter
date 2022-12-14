import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_list_state.freezed.dart';

abstract class EventsListState {}

class InitEventsState extends EventsListState {}

@freezed
class GetEventsRequestState extends EventsListState with _$GetEventsRequestState {
  const factory GetEventsRequestState.loading() = LoadingGetEventsRequestState;

  const factory GetEventsRequestState.success() = SuccessGetEventsRequestState;

  const factory GetEventsRequestState.failed(String? error) =
      FailedGetEventsRequestState;
}
