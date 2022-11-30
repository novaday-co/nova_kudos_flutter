import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class CircularMedalItem extends StatelessWidget {
  final MedalEnum medalEnum;
  final int score;

  const CircularMedalItem({
    Key? key,
    required this.medalEnum,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor(context).withOpacity(0.08),
          ),
          child: Center(
            child: ImageLoaderWidget.fromAsset(
              imageUrl: medalIcon,
              width: 50,
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 4),
        TextWidget.medium(
          medalTitle(context),
          context: context,
          additionalStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextWidget.regular(
          sprintf(context.getStrings.scoreNumber, [score]),
          context: context,
          additionalStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Color backgroundColor(BuildContext context) {
    switch (medalEnum) {
      case MedalEnum.gold:
        return Theme.of(context).colorScheme.surface;
      case MedalEnum.silver:
        return Theme.of(context).colorScheme.onSurface;
      case MedalEnum.bronze:
        return Theme.of(context).colorScheme.primary;
    }
  }

  String medalTitle(BuildContext context) {
    switch (medalEnum) {
      case MedalEnum.gold:
        return context.getStrings.goldMedal;
      case MedalEnum.silver:
        return context.getStrings.silverMedal;
      case MedalEnum.bronze:
        return context.getStrings.bronzeMedal;
    }
  }

  String get medalIcon {
    switch (medalEnum) {
      case MedalEnum.gold:
        return Assets.gold;
      case MedalEnum.silver:
        return Assets.silver;
      case MedalEnum.bronze:
        return Assets.bronze;
    }
  }
}
