import 'package:flutter/material.dart';

class NavigationPanelProvider extends ChangeNotifier {
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;

  void updateNavigationIndex(int index) {
    if (_navigationIndex == index) return;
    _navigationIndex = index;
    notifyListeners();
  }
}
