import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';

enum MedalEnum { gold, silver, bronze }

class Achievement {
  final MedalEnum? medalEnum;
  final String? title;
  final String? username;
  final DateTime? dateTime;

  Achievement({
    this.medalEnum,
    this.title,
    this.dateTime,
    this.username,
  });
}

extension AchievementExtension on Achievement {
  String get achievementAsset {
    switch (medalEnum) {
      case MedalEnum.gold:
        return Assets.goldMedal;

      case MedalEnum.silver:
        return Assets.silverMedal;

      default:
        return Assets.bronzeMedal;
    }
  }
}
