import 'package:flutter/cupertino.dart';
import 'package:news_app/src/common/localization/flutter_gen/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalization get locale => AppLocalization.of(this);
}
