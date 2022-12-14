import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_list_cubit/events_list_state.dart';

class EventsListCubit extends Cubit<EventsListState> {
  EventsListCubit() : super(InitEventsState());

  void getEvents() async {
    emit(const GetEventsRequestState.loading());
    await Future.delayed(const Duration(seconds: 3));
    emit(const GetEventsRequestState.success());
  }
}
