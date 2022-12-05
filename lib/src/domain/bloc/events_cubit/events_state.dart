import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_state.freezed.dart';

abstract class EventsState {}

class InitEventsState extends EventsState {}

@freezed
class GetEventsRequestState extends EventsState with _$GetEventsRequestState {
  const factory GetEventsRequestState.loading() = LoadingGetEventsRequestState;

  const factory GetEventsRequestState.success() = SuccessGetEventsRequestState;

  const factory GetEventsRequestState.failed(String? error) =
      FailedGetEventsRequestState;
}
