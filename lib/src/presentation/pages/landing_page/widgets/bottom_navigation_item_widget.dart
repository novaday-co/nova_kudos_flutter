import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  final bool isSelected;
  final String asset;
  final VoidCallback onTap;

  const BottomNavigationItemWidget({
    Key? key,
    required this.isSelected,
    required this.asset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: IconWidget(
          icon: asset,
          height: 25,
          width: 25,
          iconColor: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
