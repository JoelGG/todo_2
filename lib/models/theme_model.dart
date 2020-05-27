import 'package:flutter/material.dart';
import 'package:rems/data/themes.dart';

class ThemeModel extends ChangeNotifier {
  bool _useSystemTheme = true;
  Themes _theme = Themes.Blue;

  get useSystemTheme => _useSystemTheme;
  get theme => _theme;
  get themePreset => themePresets[_theme];

  void toggleSystemTheme() {
    _useSystemTheme = !_useSystemTheme;
    notifyListeners();
  }

  void setTheme(String s) {
    _theme = _themeFromString(s);
    notifyListeners();
  }

  Themes _themeFromString(String s) {
    Themes t;

    switch (s) {
      case 'Light: Blue':
        t = Themes.Blue;
        break;
      case 'Light: Green':
        t = Themes.Green;
        break;
      case 'Dark: Deep Black':
        t = Themes.Dark;
        break;
    }

    return t;
  }

  String themeAsString() {
    String s;

    switch (_theme) {
      case Themes.Blue:
        s = 'Light: Blue';
        break;
      case Themes.Green:
        s = 'Light: Green';
        break;
      case Themes.Dark:
        s = 'Dark: Deep Black';
        break;
    }

    return s;
  }
}