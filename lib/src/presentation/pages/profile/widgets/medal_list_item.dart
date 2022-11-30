import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class MedalListItem extends StatelessWidget {
  final int index;
  final Achievement achievement;

  const MedalListItem({
    Key? key,
    required this.index,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageLoaderWidget.fromAsset(
                imageUrl: medalIcon,
                width: 24,
                height: 24,
              ),
              TextWidget.bold(
                achievement.title ?? '',
                context: context,
                additionalStyle: const TextStyle(fontSize: 12),
              )
            ],
          ),
          TextWidget.regular(
            sprintf(
              context.getStrings.inDate,
              [achievement.dateTime!.formattedJalaliDate],
            ),
            context: context,
            additionalStyle: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Color backgroundColor(BuildContext context) {
    int remaining = index % 4;
    if (remaining == 0) {
      return Theme.of(context).colorScheme.primary.withOpacity(0.08);
    } else if (remaining == 1) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.08);
    } else if (remaining == 2) {
      return Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.08);
    } else {
      return Theme.of(context).colorScheme.surface.withOpacity(0.08);
    }
  }

  String get medalIcon {
    switch (achievement.medalEnum!) {
      case MedalEnum.gold:
        return Assets.goldMedal;
      case MedalEnum.silver:
        return Assets.silverMedal;
      case MedalEnum.bronze:
        return Assets.bronzeMedal;
    }
  }
}
