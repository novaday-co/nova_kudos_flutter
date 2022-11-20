import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/injector.dart';
import 'package:nova_kudos_flutter/src/presentation/config/animated_page_route_builder.dart';
import 'package:nova_kudos_flutter/src/presentation/config/navigation_observer.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/colors/light_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.inject();
  BlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
  );
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
      builder: (context, child) => botToastBuilder(context, child),
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
