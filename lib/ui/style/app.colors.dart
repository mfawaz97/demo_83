import 'package:flutter/material.dart';

class AppColors {
  static const Color kEmptyColor = Color(0XFFF2F2F2);

  /*
    themes: {
          dark: {
            primary: '#3b9cd6',
            secondary: '#424242',
            accent: '#1E1E1E',
            error: '#FF5252',
            info: '#E3F2FD',
            success: '#4CAF50',
            warning: '#FFC107',
            background: '#18191a'
          },
          light: {
            primary: '#3b9cd6',
            secondary: '#b0bec5',
            accent: '#8c9eff',
            error: '#b71c1c',
            info: '#E3F2FD',
            success: '#4CAF50',
            warning: '#FFC107',
            background: '#f0f2f5'
          },

  */

  static const MaterialColor darkColors = MaterialColor(
    0xFF3b9cd6,
    <int, Color>{
      50: Color(0xFF3b9cd6),
      100: Color(0xFF2F2F2F),
      200: Color(0xFF1E1E1E),
      300: Color(0xFF262626),
      400: Color(0xFF888888),
    },
  );

  static const MaterialColor primaryColors = MaterialColor(
    0xFF3b9cd6,
    <int, Color>{
      50: Color(0xFF424242),
      100: Color(0xFF1E1E1E),
      150: Color(0xFFFF5252),
      200: Color(0xFFE3F2FD),
      300: Color(0xFF4CAF50),
      400: Color(0xFFFFC107),
    },
  );

  static const MaterialColor randomColors = MaterialColor(
    0xFFFEBCBD,
    <int, Color>{
      0: Color(0xFFFEBCBD),
      1: Color(0xFFBDE8F3),
      2: Color(0xFFFAD3B4),
      3: Color(0xFFEFC631),
      4: Color(0xFFE7C2DA),
      5: Color(0xFFF98F54),
      6: Color(0xFF9498F2),
      7: Color(0xFFE2DD56),
      8: Color(0xFF82E373),
    },
  );

  static const MaterialColor customGreyLevels = MaterialColor(
    0xFF161615,
    <int, Color>{
      50: Color(0xFF161615),
      100: Color(0xFF979797),
      200: Color(0xFFE4E4E4),
      300: Color(0xFFF8F8F8),
      400: Color(0xFFF5F5F5),
      500: Color(0xFFEFEFEF),
      600: Color(0xFF636363),
      700: Color(0xFFACACAC),
    },
  );

  static Color primaryColorDark = const Color(0xFF153A6E);

  static Color primaryColor = const Color(0xFF00ACFF);

  static Color white = const Color(0xFFFFFFFF);

  static Color background = const Color(0xFFE5E5E5);

  static Color accentColor1 = const Color(0xFF29AAE1);

  static Color cardColor = const Color(0xFF5476A6);
}
