import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: lightPrimaryColor,
        secondary: lightPrimaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: lightBackgroundColor,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: lightPrimaryColor,
      foregroundColor: Colors.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
      titleLarge: lightTitleTextLarge,
      titleSmall: lightTitleTextSmall,
      bodyLarge: lightBodyTextLarge,
      bodySmall: lightBodyTextSmall,
      bodyMedium: lightBodyTextMedium,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF141922),
        onPrimary: darkPrimaryColor,
        secondary: darkPrimaryColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: darkBackgroundColor,
        onBackground: Colors.white,
        surface: darkBackgroundColor,
        onSurface: Colors.white),
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: darkPrimaryColor,
      foregroundColor: Colors.black,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
      titleLarge: darkTitleTextLarge,
      titleSmall: darkTitleTextSmall,
      bodyLarge: darkBodyTextLarge,
      bodySmall: darkBodyTextSmall,
      bodyMedium: darkBodyTextMedium,
    ),
  );
}
