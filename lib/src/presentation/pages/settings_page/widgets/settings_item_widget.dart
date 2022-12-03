import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const SettingsItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextWidget.medium(
                  title,
                  context: context,
                  additionalStyle: TextStyle(
                    fontSize: 16,
                    color: textColor ?? Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
              ),
              IconWidget(
                icon: icon,
                size: 24,
                iconColor: iconColor ?? Theme.of(context).colorScheme.onTertiary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
