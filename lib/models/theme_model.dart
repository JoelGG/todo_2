import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rems/data/themes.dart';
import 'package:rems/storage/storage.dart';

class ThemeModel extends ChangeNotifier {
  bool _useSystemTheme = true;
  Themes _theme = Themes.Blue;

  get useSystemTheme => _useSystemTheme;
  get theme => _theme;
  get themePreset => themePresets[_theme];

  ThemeModel() {
    load();
  }

  void load() async {
    bool useSystemTheme = true;
    Themes theme = getSystemTheme();
    try {
      final file = await Storage.localFile('theme_preference');
      final fileContents = await file.readAsString();
      final json = jsonDecode(fileContents);
      useSystemTheme = json['useSystemTheme'];
      theme =  _themeFromString(json['theme']);
    } catch (e) {
      print(e);
    }
    _useSystemTheme = useSystemTheme;
    if (!_useSystemTheme) {
      _theme = theme;
    }
    notifyListeners();
  }

  void write() async {
    final file = await Storage.localFile('theme_preference');

    Map json = {
      'useSystemTheme': _useSystemTheme,
      'theme': themeAsString(),
    };

    file.writeAsStringSync(jsonEncode(json));
  }

  void toggleSystemTheme() {
    _useSystemTheme = !_useSystemTheme;
    if (_useSystemTheme) {
      _theme = getSystemTheme();
    }
    write();
    notifyListeners();
  }

  void setTheme(String s) {
    _theme = _themeFromString(s);
    write();
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

  Themes getSystemTheme() {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    Themes theme;

    switch (brightness) {
      case Brightness.light:
        theme = Themes.Blue;
        break;
      case Brightness.dark:
        theme = Themes.Dark;
        break;
    }

    return theme;
  }
}