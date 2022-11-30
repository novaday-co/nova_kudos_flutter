import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/landing_page_cubit/landing_page_state.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/landing_page/widgets/bottom_navigation_widget.dart';


class LandingPageCubit extends Cubit<LandingPageState> {
  LandingPageCubit() : super(LandingInitState());

  void switchToPageByIndex(int index) {
    switch (index) {
      case 0:
        emit(PageSwitchState.homePage(index));
        break;
      case 1:
        emit(PageSwitchState.shopPage(index));
        break;
      case 2:
        emit(PageSwitchState.membersPage(index));
        break;
      case 3:
        emit(PageSwitchState.settingsPage(index));
        break;
    }
  }

  void switchToPageByName(NavigationPagesEnum pages) {
    switch (pages) {
      case NavigationPagesEnum.home:
        emit(const PageSwitchState.homePage(0));
        break;
      case NavigationPagesEnum.shop:
        emit(const PageSwitchState.shopPage(1));
        break;
      case NavigationPagesEnum.members:
        emit(const PageSwitchState.membersPage(2));
        break;
      case NavigationPagesEnum.settings:
        emit(const PageSwitchState.settingsPage(3));
        break;
    }
  }

}
