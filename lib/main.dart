import 'package:hive/hive.dart';
import 'package:nova_kudos_flutter/src/domain/config/env/environment.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/bloc_exception_handler.dart';
import 'package:nova_kudos_flutter/src/injector.dart';
import 'package:nova_kudos_flutter/src/presentation/config/animated_page_route_builder.dart';
import 'package:nova_kudos_flutter/src/presentation/config/navigation_observer.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/colors/light_theme.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/tags.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widget_behavior/scroll_behavior.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future<void> _openHiveBoxes() async {
  await Hive.openBox(Tags.userBoxKey);
  await Hive.openBox(Tags.preferencesBoxKey);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.loadEnvironment();
  await Injector.inject();
  await _openHiveBoxes();
  Bloc.observer = BlocExceptionHandler();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MaterialApp(
      title: 'Nova Kudos',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [
        KiwiContainer().resolve<NavigationObserver>(),
        BotToastNavigatorObserver(),
      ],
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      locale: const Locale('fa', 'IR'),
      builder: (context, child) => ResponsiveWrapper.builder(
        ScrollConfiguration(
          behavior: AccessScrollBehavior(),
          child: GestureDetector(
            onPanDown: (detail) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            child: botToastBuilder(context, child),
          ),
        ),
        defaultScale: false,
        maxWidth: 900,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1800, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: (settings) => AnimatedPageRouteBuilder(settings),
    );
  }
}
