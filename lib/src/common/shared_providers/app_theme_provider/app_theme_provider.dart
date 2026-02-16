import 'package:flutter/material.dart';
import 'package:news_app/src/common/theme/app_theme.dart';
import 'package:news_app/src/common/theme/news_theme.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  NewsTheme get currentTheme => lightTheme;
  // NewsTheme get currentTheme => _isDark ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
