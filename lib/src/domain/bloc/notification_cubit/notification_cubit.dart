import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/notification/notification_model.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitNotificationState());

  void getNotification() async {
    List<NotificationModel> notifications = [
      NotificationModel(
          text: "دریافت سکه از طرف محسن نیرومند",
          diffTime: "2روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
      NotificationModel(
          text: "دریافت سکه از طرف امیرمحمد جباری",
          diffTime: "3روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
      NotificationModel(
          text: "دریافت سکه از طرف محسن نیرومند",
          diffTime: "2روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
      NotificationModel(
          text: "دریافت سکه از طرف آرام امینی",
          diffTime: "3روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
      NotificationModel(
          text: "دریافت سکه از طرف آرمان محمدی",
          diffTime: "2روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
      NotificationModel(
          text: "دریافت سکه از طرف پریسا باستانی",
          diffTime: "2روز پیش",
          userProfile: "https://picsum.photos/seed/picsum/200/300"),
    ];
    emit(const NotificationRequestState.loading());
    await Future.delayed(const Duration(seconds: 3));
    emit(NotificationRequestState.success(notifications));
  }

}
