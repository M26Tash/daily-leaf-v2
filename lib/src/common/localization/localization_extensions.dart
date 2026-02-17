import 'package:flutter/cupertino.dart';
import 'package:daily_leaf/src/common/localization/flutter_gen/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalization get locale => AppLocalization.of(this);
}
