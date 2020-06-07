import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rems/storage/storage.dart';

class GeneralPreferencesModel extends ChangeNotifier {
  bool _showMenuTitles = true;

  get showMenuTitles => _showMenuTitles;

  GeneralPreferencesModel() {
    load();
  }

  void load() async {
    try {
      final file = await Storage.localFile('general_preferences');
      final fileContents = await file.readAsString();
      final json = jsonDecode(fileContents);
      _showMenuTitles = json['showMenuTitles'];
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void write() async {
    final file = await Storage.localFile('general_preferences');
    final json = {
      'showMenuTitles': _showMenuTitles,
    };
    file.writeAsString(jsonEncode(json));
  }

  void setMenuTitles(value) {
    _showMenuTitles = value;
    notifyListeners();
    write();
  }
}