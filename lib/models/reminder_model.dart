import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rems/storage/storage.dart';
import 'package:rems/data/task.dart';

class ReminderModel extends ChangeNotifier {
  List<Task> _reminders = new List();
  List<Task> _completed = new List();
  
  get reminders => _reminders;
  get completed => _completed;

  ReminderModel() {
    load();
  }

  void add(Task t) {
    _reminders.add(t);
    write();
    notifyListeners();
  }

  void load() async {
    final reminders = new List<Task>();
    final completed = new List<Task>();
    try {
      final file = await Storage.localFile('reminders');
      final fileContents = await file.readAsString();
      final json = jsonDecode(fileContents);
      json['reminders'].forEach((e) {reminders.add(Task.fromJson(e));});
      json['completed'].forEach((e) {completed.add(Task.fromJson(e));});
    } catch (e) {
      print(e);
    }
    _reminders = reminders;
    _completed = completed;
    notifyListeners();
  }

  void write() async {
    final file = await Storage.localFile('reminders');

    Map json = {
      'reminders': _reminders,
      'completed': completed,
    };

    file.writeAsStringSync(jsonEncode(json));
  }

  void complete(Task t) {
    _completed.add(t);
    _reminders.remove(t);
    write();
    notifyListeners();
  }

  void replace(Task old, Task n) {
    int index =_reminders.indexOf(old);
    _reminders[index] = n;
    write();
    notifyListeners();
  }

  void remove(Task t) {
    _reminders.remove(t);
    write();
    notifyListeners();
  }

  void bin(Task t) {
    _completed.remove(t);
    write();
    notifyListeners();
  }
}