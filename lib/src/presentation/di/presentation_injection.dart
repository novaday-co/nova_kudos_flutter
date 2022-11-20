import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/presentation/config/navigation_observer.dart';

class PresentationInjection {

  static void inject() {
    _injectSingletons();
  }

  static void _injectSingletons() {
    KiwiContainer().registerSingleton<NavigationObserver>((container) =>
        NavigationObserver());
  }
}