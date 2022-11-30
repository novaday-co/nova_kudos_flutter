import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/landing_cubit/landing_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/landing_cubit/landing_state.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/home_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/landing_page/widgets/bottom_navigation_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/members_page/members_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/settings_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/shop_page.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';

class LandingPage extends BaseStatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState
    extends BaseStatefulWidgetState<LandingPage, LandingCubit> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget? bottomNavigation() {
    return BlocConsumer<LandingCubit, LandingState>(
      listener: _listenToBottomNavigation,
      buildWhen: _buildWhenBottomNavigation,
      listenWhen: _buildWhenBottomNavigation,
      builder: (context, state) => CustomBottomNavigation(
        selectedPage: state is PageSwitchState ? state.index : 0,
        onTapItem: (navigationPage) {
          context.read<LandingCubit>().switchToPageByName(navigationPage);
        },
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        ShopPage(),
        MembersPage(),
        SettingsPage(),
      ],
    );
  }

  bool _buildWhenBottomNavigation(
      LandingState? previous, LandingState? current) {
    return current is PageSwitchState;
  }

  void _listenToBottomNavigation(BuildContext context, LandingState state) {
    if (state is PageSwitchState) {
      pageController.animateToPage(
        state.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
