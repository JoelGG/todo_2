import 'package:flutter/material.dart';

enum Themes {
 Blue,
 Green,
 Dark,
}

final Map themePresets = {
  Themes.Blue : ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    backgroundColor: Colors.white,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.blueAccent,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  ),
  Themes.Green : ThemeData(
    primaryColor: Colors.green,
    accentColor: Colors.lightGreen,
    backgroundColor: Colors.white,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.lightGreen,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),

    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: Colors.green),
    ),

  ),
  Themes.Dark : ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.grey,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.red,
    )
  ),
};