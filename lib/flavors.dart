enum Flavor {
  PRODUCTION,
  DEVELOPMENT,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'NovaKodus';
      case Flavor.DEVELOPMENT:
        return 'NovaKodus develop';
      default:
        return 'title';
    }
  }

}
