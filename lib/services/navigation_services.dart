import 'package:flutter/cupertino.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static replaceAreaTo(String routeArea) {
    return navigatorKey.currentState!.pushReplacementNamed(routeArea);
  }

  static replaceCursoTo(String routeCurso) {
    return navigatorKey.currentState!.pushReplacementNamed(routeCurso);
  }
}
