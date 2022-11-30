enum MedalEnum { gold, silver, bronze }

class Achievement {
  final MedalEnum? medalEnum;
  final String? title;
  final DateTime? dateTime;

  Achievement({
    this.medalEnum,
    this.title,
    this.dateTime,
  });
}
