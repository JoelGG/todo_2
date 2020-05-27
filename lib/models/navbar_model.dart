import 'package:flutter/material.dart';

class NavBarModel extends ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void index(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}