import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/landing_page/widgets/bottom_navigation_item_widget.dart';

enum NavigationPagesEnum { home, shop, members, settings }

class CustomBottomNavigation extends StatelessWidget {
  final Function(NavigationPagesEnum) onTapItem;
  final int selectedPage;

  const CustomBottomNavigation({
    Key? key,
    required this.onTapItem,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 0,
            )
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    BottomNavigationItemWidget(
                      isSelected: selectedPage == 0,
                      asset: Assets.iconHome,
                      onTap: () => onTapItem(NavigationPagesEnum.home),
                    ),
                    BottomNavigationItemWidget(
                      isSelected: selectedPage == 1,
                      asset: Assets.iconShop,
                      onTap: () => onTapItem(NavigationPagesEnum.shop),
                    ),
                    BottomNavigationItemWidget(
                      isSelected: selectedPage == 2,
                      asset: Assets.iconMembers,
                      onTap: () => onTapItem(NavigationPagesEnum.members),
                    ),
                    BottomNavigationItemWidget(
                      isSelected: selectedPage == 3,
                      asset: Assets.iconSettings,
                      onTap: () => onTapItem(NavigationPagesEnum.settings),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                right: positioned(constraints),
                duration: const Duration(milliseconds: 300),
                child: Center(
                  widthFactor: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    height: 5,
                    width: 5,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double positioned(BoxConstraints constraints) {
    return ((constraints.maxWidth / 4) * selectedPage + (constraints.maxWidth / 4)/2);
  }
}
