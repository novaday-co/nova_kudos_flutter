import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'landing_page_state.freezed.dart';

abstract class LandingPageState {}

class LandingInitState extends LandingPageState {}

@freezed
class PageSwitchState extends LandingPageState with _$PageSwitchState {
  const factory PageSwitchState.homePage(int index) = HomePageState;
  const factory PageSwitchState.shopPage(int index) = ShopPageState;
  const factory PageSwitchState.membersPage(int index) = MembersPageState;
  const factory PageSwitchState.settingsPage(int index) = SettingsPageState;
}