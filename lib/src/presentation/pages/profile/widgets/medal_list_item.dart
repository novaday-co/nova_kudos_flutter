import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/circular_medal_item.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';

class MedalListItem extends StatelessWidget {
  final int index;
  final MedalEnum medalEnum;

  const MedalListItem({Key? key, required this.index, required this.medalEnum})
      : super(key: key);

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
        children: [
          ImageLoaderWidget.fromAsset(
            imageUrl: medalIcon,
            width: 24,
            height: 24,
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
    switch (medalEnum) {
      case MedalEnum.gold:
        return Assets.goldMedal;
      case MedalEnum.silver:
        return Assets.silverMedal;
      case MedalEnum.bronze:
        return Assets.bronzeMedal;
    }
  }
}
