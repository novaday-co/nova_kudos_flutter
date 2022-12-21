import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
part 'settings_state.freezed.dart';

abstract class SettingsState {}

class InitSettingsState extends SettingsState {}

@freezed
class LogoutSettingsState extends SettingsState with _$LogoutSettingsState {
  const factory LogoutSettingsState.loading() =
  LoadingLogoutSettingsState;

  const factory LogoutSettingsState.success() =
  SuccessLogoutSettingsState;

}
