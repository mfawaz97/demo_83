import 'package:demo_83/ui/modules/home/home.navigation.dart';
import 'package:demo_83/util/constants.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static String? routeName;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    routeName = settings.name;

    switch (settings.name) {
      case Constants.mainPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Constants.mainPage),
          builder: (_) => const HomePage(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
