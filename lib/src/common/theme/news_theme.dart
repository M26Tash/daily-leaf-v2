import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class NewsTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color surfaceColor;

  final Color primaryColor;
  final Color accentColor;

  final Color transparent;

  final Color primaryIconColor;
  final Color secondaryIconColor;
  final Color lightIconColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;

  final String fontFamily;

  final Brightness statusBarTheme;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
    isDark,
    backgroundColor,
    surfaceColor,
    primaryColor,
    accentColor,
    primaryIconColor,
    secondaryIconColor,
    lightIconColor,
    transparent,
    primaryTextColor,
    secondaryTextColor,
    fontFamily,
    statusBarTheme,
    navigationBarBrightness,
  ];

  const NewsTheme({
    required this.isDark,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.primaryColor,
    required this.accentColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.lightIconColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.fontFamily,
    required this.statusBarTheme,
    required this.navigationBarBrightness,
  });
}
