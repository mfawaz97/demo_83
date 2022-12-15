import 'dart:io';

import 'package:demo_83/util/injectables/injectable.variables.dart';
import 'package:demo_83/util/injectables/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OwnThemeFields {
  final Color iconColorAlt;
  final Color iconColorAlt2;
  final Color buttonColorAlt;
  final Color containerColorAlt;
  final Color containerColorAlt2;
  final Color circuleBorderColor;
  final Color circuleBorderInactiveColor;
  final Color onlineColor;
  final Color offlineColor;
  final Color highlightedContainerColor;
  final Color textColorAlt;
  final Color textColorAlt2;
  final Color alertColor;
  final Color lightContainerColor;
  final Color lightTextColor;

  OwnThemeFields({
    this.containerColorAlt = const Color(0xFFF0F0F0),
    this.containerColorAlt2 = const Color(0xFFF0F0F0),
    this.highlightedContainerColor = const Color(0xFFFF6D6D),
    this.iconColorAlt = const Color(0xFF8E9490),
    this.iconColorAlt2 = const Color(0xCC383838),
    this.buttonColorAlt = const Color(0xFF6285f9),
    this.circuleBorderColor = const Color(0xFFB4C2D3),
    this.onlineColor = const Color(0xFF2CB9B0),
    this.offlineColor = const Color(0xFFD1D1D1),
    this.circuleBorderInactiveColor = const Color(0x80B4C2D3),
    this.textColorAlt = const Color(0xFFB5B2C2),
    this.textColorAlt2 = const Color(0xCC383838),
    this.alertColor = const Color(0xFFF31629),
    this.lightContainerColor = const Color(0xFFF6F6F6),
    this.lightTextColor = const Color(0xFFC0C0C0),
  });

  factory OwnThemeFields.empty() {
    return OwnThemeFields(
      iconColorAlt: const Color(0xFF8E9490),
      iconColorAlt2: const Color(0xCC383838),
      containerColorAlt: const Color(0xFFF0F0F0),
      containerColorAlt2: const Color(0xFFF0F0F0),
      highlightedContainerColor: const Color(0xFFFF6D6D),
      buttonColorAlt: const Color(0xFF6285f9),
      circuleBorderColor: const Color(0xFFB4C2D3),
      onlineColor: const Color(0xFF2CB9B0),
      offlineColor: const Color(0xFFD1D1D1),
      circuleBorderInactiveColor: const Color(0x80B4C2D3),
      textColorAlt: const Color(0xFFB5B2C2),
      textColorAlt2: const Color(0xCC383838),
      alertColor: const Color(0xFFF31629),
    );
  }
}

extension ThemeDataExtensions on ThemeData {
  static final Map<ThemeMode, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _own[getIt<InjectableVariables>().themeMode!] = own;
  }

  static late OwnThemeFields empty;

  OwnThemeFields own() {
    var o = _own[getIt<InjectableVariables>().themeMode];
    o ??= empty;
    return o;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFFF4F9FA),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      ),
    ),
    bottomAppBarColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    dividerColor: const Color(0xFFE0E0E0),
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xCC383838),
      brightness: Brightness.light, // Your accent color
    ),
    disabledColor: const Color(0xFF8E9490),
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    primaryColorLight: const Color(0xFFF6F6F6),
    // primaryColorBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    // shadowColor: Colors.grey[200],
    hoverColor: Colors.blue,
  )..addOwn(
      OwnThemeFields(
        containerColorAlt: const Color(0xFFFEC8BD),
        containerColorAlt2: const Color(0xFFF5F7F9),
        highlightedContainerColor: const Color(0xFFEE6A61),
        buttonColorAlt: const Color(0xFFD93E11),
        iconColorAlt: const Color(0xFF949494),
        iconColorAlt2: const Color(0xFFD93E11),
        circuleBorderColor: Colors.black,
        onlineColor: const Color(0xFF2CB9B0),
        offlineColor: const Color(0xFFD1D1D1),
        circuleBorderInactiveColor: const Color(0x80343339),
        textColorAlt2: const Color(0xFF474749),
        alertColor: const Color(0xFFF31629),
      ),
    );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFFF4F9FA),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      ),
    ),
    bottomAppBarColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    dividerColor: const Color(0xFFE0E0E0),
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xCC383838),
      brightness: Brightness.light, // Your accent color
    ),
    disabledColor: const Color(0xFF8E9490),
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    primaryColorLight: const Color(0xFFF6F6F6),
    // primaryColorBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    // shadowColor: Colors.grey[200],
    hoverColor: Colors.blue,
  )..addOwn(
      OwnThemeFields(
        containerColorAlt: const Color(0xFFFEC8BD),
        containerColorAlt2: const Color(0xFFF5F7F9),
        highlightedContainerColor: const Color(0xFFEE6A61),
        buttonColorAlt: const Color(0xFFD93E11),
        iconColorAlt: const Color(0xFF949494),
        iconColorAlt2: const Color(0xFFD93E11),
        circuleBorderColor: Colors.black,
        onlineColor: const Color(0xFF2CB9B0),
        offlineColor: const Color(0xFFD1D1D1),
        circuleBorderInactiveColor: const Color(0x80343339),
        textColorAlt2: const Color(0xFF474749),
        alertColor: const Color(0xFFF31629),
      ),
    );

  static TextTheme lightTextTheme = TextTheme(
    headline1: headline1.copyWith(color: const Color(0xFF474749)),
    headline2: headline2.copyWith(color: const Color(0xFF474749)),
    headline3: headline3.copyWith(color: const Color(0xFF474749)),
    headline4: headline4.copyWith(color: const Color(0xFF474749)),
    headline5: headline5.copyWith(color: const Color(0xFF474749)),
    headline6: headline6,
    button: button,
    caption: caption,
    bodyText1: bodyText1.copyWith(color: const Color(0xFF474749)),
    bodyText2: bodyText2.copyWith(color: const Color(0xFF474749)),
    subtitle1: subtitle1.copyWith(color: const Color(0xFF474749)),
    subtitle2: subtitle2,
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: headline1.copyWith(color: Colors.white),
    headline2: headline2.copyWith(color: Colors.white),
    headline3: headline3.copyWith(color: Colors.white),
    headline4: headline4.copyWith(color: Colors.white),
    headline5: headline5.copyWith(color: Colors.white),
    headline6: headline6,
    button: button,
    caption: caption,
    bodyText1: bodyText1.copyWith(color: Colors.white),
    bodyText2: bodyText2.copyWith(color: Colors.white),
    subtitle1: subtitle1.copyWith(color: Colors.white),
    subtitle2: subtitle2,
  );

  static TextTheme textTheme = TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    button: button,
    caption: caption,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
  );

  static TextStyle headline1 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFFB5B2C2),
    fontSize: 18,
  );

  static TextStyle headline2 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFFB5B2C2),
    fontSize: 12,
  );

  static TextStyle headline3 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFFB5B2C2),
    fontSize: 10,
  );

  static TextStyle headline4 = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFFB5B2C2),
    fontSize: 12,
  );

  static TextStyle headline5 = const TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xFFB5B2C2),
    fontSize: 12,
  );

  static TextStyle headline6 = const TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xFFB5B2C2),
    fontSize: 14,
  );

  static TextStyle button = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Color(0xFFB5B2C2),
    fontSize: 14,
  );
  static TextStyle bodyText1 = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFFB5B2C2),
    fontSize: 10,
  );

  static TextStyle bodyText2 = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Color(0xFFB5B2C2),
    fontSize: 10,
  );

  static TextStyle caption = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Color(0xFFB5B2C2),
    fontSize: 12,
  );

  static TextStyle subtitle1 = const TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xFFB5B2C2),
    fontSize: 8,
  );
  static TextStyle subtitle2 = const TextStyle(
    fontWeight: FontWeight.w300,
    color: Color(0xFFB5B2C2),
    fontSize: 10,
  );
}
