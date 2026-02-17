import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/theme/news_theme.dart';
import 'package:daily_leaf/src/common/theme/theme_provider.dart';

extension ThemeExtension on BuildContext {
  NewsTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}
