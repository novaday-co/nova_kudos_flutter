import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_cubit/events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(InitEventsState());
}
