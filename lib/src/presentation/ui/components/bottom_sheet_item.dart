import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class BottomSheetItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String icon;

  const BottomSheetItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            TextWidget.medium(
              title,
              context: context,
              additionalStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
            const Spacer(),
            IconWidget(
              icon: icon,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
