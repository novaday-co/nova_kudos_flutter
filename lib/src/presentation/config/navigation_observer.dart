import 'package:flutter/material.dart';


class NavigationObserver extends NavigatorObserver {
  List<Route> routeStack = [];
  String? currentRoute = "";

  @override
  void didPush(Route route, Route? previousRoute) {
    routeStack.add(route);
    currentRoute = route.settings.name;
    super.didPush(route, previousRoute);
  }


  @override
  void didPop(Route route, Route? previousRoute) {
    routeStack.removeLast();
    currentRoute = route.settings.name;
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    routeStack.removeLast();
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (routeStack.isNotEmpty) routeStack.removeLast();
    currentRoute = newRoute?.settings.name;
    routeStack.add(newRoute!);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

}