import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

enum MedalEnum { gold, silver, bronze }

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
          medalTitle,
          context: context,
          additionalStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextWidget.regular(
          '$score امتیاز ',
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

  String get medalTitle {
    switch (medalEnum) {
      case MedalEnum.gold:
        return "مدال طلا";
      case MedalEnum.silver:
        return "مدال نقره";
      case MedalEnum.bronze:
        return "مدال برنز";
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
