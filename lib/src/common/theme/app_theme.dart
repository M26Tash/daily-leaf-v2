import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/src/common/constants/app_fonts.dart';
import 'package:news_app/src/common/theme/news_theme.dart';

const _ateneoBlue = Color(0xFF003366);
const _mineShaft = Color(0xFF323232);
const _white = Color(0xFFFFFFFF);
const _black = Color(0xFF000000);
const _transparent = Color(0x00000000);

const lightTheme = NewsTheme(
  isDark: false,
  backgroundColor: _white,
  surfaceColor: _white,
  primaryColor: _ateneoBlue,
  accentColor: _ateneoBlue,
  primaryIconColor: _black,
  secondaryIconColor: _white,
  transparent: _transparent,
  primaryTextColor: _mineShaft,
  secondaryTextColor: _black,
  // fontFamily: fontFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
);

ThemeData generateThemeData(NewsTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: theme.isDark ? Brightness.dark : Brightness.light,
    // fontFamily: theme.fontFamily,
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
