import 'package:flutter/material.dart';

abstract final class AppDimensions {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double preLarge = 12;
  static const double large = 16;
  static const double extraLarge = 32;
  static const double superLarge = 64;
  static const double extremeLarge = 128;

  // other values?
  static const double largeBorderRadius = 24;
  static const double mediumBorderRadius = 12;
  static const double standartNewsDimensions = 110;
  static const double smallIconSize = 20;
  static const double leafIconSize = 40;
  static const double splashIconSize = 100;
  static const double bookmarkIconSize = 80;
  static const double articleDetailsAppBarHeight = 400;
  static const double carouselSliderHeight = 280;
  static const double indicatorDotSize = 8.0;
  static const double indicatorSpacing = 10.0;
  static const double panelNavigationIconSize = 30;
}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
