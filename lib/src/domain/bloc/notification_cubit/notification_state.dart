import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/notification/notification_model.dart';

part 'notification_state.freezed.dart';

abstract class NotificationState {}

class InitNotificationState extends NotificationState {}

@freezed
class NotificationRequestState extends NotificationState with _$NotificationRequestState {
  const factory NotificationRequestState.loading() =
      LoadingNotificationRequestState;

  const factory NotificationRequestState.success(List<NotificationModel> notifications) =
      SuccessNotificationRequestState;

  const factory NotificationRequestState.failed(String? error) =
      FailedNotificationRequestState;
}
