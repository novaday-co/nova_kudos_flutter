import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'landing_state.freezed.dart';

abstract class LandingState {}

class LandingInitState extends LandingState {}

@freezed
class PageSwitchState extends LandingState with _$PageSwitchState {
  const factory PageSwitchState.homePage(int index) = HomePageState;
  const factory PageSwitchState.shopPage(int index) = ShopPageState;
  const factory PageSwitchState.membersPage(int index) = MembersPageState;
  const factory PageSwitchState.settingsPage(int index) = SettingsPageState;
}