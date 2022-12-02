import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/notification/notification_model.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitNotificationState());


}
