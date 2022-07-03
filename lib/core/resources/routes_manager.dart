import 'package:flutter/material.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/modules/todo/presentation/pages/add_note_page.dart';
import 'package:todo/modules/todo/presentation/pages/home_page.dart';
import 'package:todo/modules/user/presentation/pages/login_page.dart';
import 'package:todo/modules/user/presentation/pages/splash_page.dart';

class Routes {
  static const String initRoute = splashRoute;
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String addNoteRoute = '/note/add';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case Routes.addNoteRoute:
        return MaterialPageRoute(
          builder: (_) => const AddNotePage(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
