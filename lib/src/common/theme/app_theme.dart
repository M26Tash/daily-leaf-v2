// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/constants/font_family.dart';
import 'package:daily_leaf/src/common/theme/news_theme.dart';

const _ateneoBlue = Color(0xFF003366);
const _mineShaft = Color(0xFF323232);
const _white = Color(0xFFFFFFFF);
const _black = Color(0xFF000000);
const _transparent = Color(0x00000000);

const _oliveLeaf = Color(0xFF606C38);
const _blackForest = Color(0xFF283618);
const _cornsilk = Color(0xFFFEFAE0);
const _lightCaramel = Color(0xFFDDA15E);
const _copper = Color(0xFFBC6C25);

const lightTheme = NewsTheme(
  isDark: false,
  backgroundColor: _cornsilk,
  surfaceColor: _lightCaramel,
  primaryColor: _blackForest,
  accentColor: _copper,
  primaryIconColor: _blackForest,
  secondaryIconColor: _copper,
  lightIconColor: _cornsilk,
  transparent: _transparent,
  primaryTextColor: _blackForest,
  secondaryTextColor: _oliveLeaf,
  fontFamily: FontFamily.montserratFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.light,
);

final darkTheme = NewsTheme(
  isDark: true,
  backgroundColor: _blackForest,
  surfaceColor: _oliveLeaf,
  primaryColor: _cornsilk,
  accentColor: _copper,
  primaryIconColor: _cornsilk,
  secondaryIconColor: _lightCaramel,
  lightIconColor: _cornsilk,
  transparent: _transparent,
  primaryTextColor: _cornsilk,
  secondaryTextColor: _lightCaramel.withValues(
    alpha: 0.8,
  ),
  fontFamily: FontFamily.montserratFamily,
  statusBarTheme: Brightness.light,
  navigationBarBrightness: Brightness.dark,
);

ThemeData generateThemeData(NewsTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: theme.isDark ? Brightness.dark : Brightness.light,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.primaryColor,
      selectionHandleColor: theme.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineLarge,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparent,
        statusBarIconBrightness: theme.statusBarTheme,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
