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
}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
