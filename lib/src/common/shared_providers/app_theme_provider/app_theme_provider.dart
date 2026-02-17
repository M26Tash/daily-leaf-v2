import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/theme/app_theme.dart';
import 'package:daily_leaf/src/common/theme/news_theme.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  NewsTheme get currentTheme => _isDark ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
