import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/config/route_generator.dart';

class AnimatedPageRouteBuilder extends PageRouteBuilder {
  AnimatedPageRouteBuilder(RouteSettings settings)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return RouteGenerator.getRoutes(settings)[settings.name]!
          .call(context);
    },
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionDuration: const Duration(milliseconds: 509),
  );
}