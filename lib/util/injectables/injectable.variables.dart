import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class InjectableVariables {
  String? fontFamily;

  late Locale locale;

  ThemeMode? themeMode;

  GlobalKey<NavigatorState>? globalNavigatorKey;
}
