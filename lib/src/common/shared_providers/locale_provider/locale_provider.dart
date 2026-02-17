import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> loadSavedLocale() async {
    final pref = await SharedPreferences.getInstance();
    final String? langCode = pref.getString('lang');

    _locale = Locale(langCode ?? 'ru');
    Intl.defaultLocale = _locale!.languageCode;
    notifyListeners();
  }

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;

    _locale = newLocale;
    Intl.defaultLocale = newLocale.languageCode;

    final pref = await SharedPreferences.getInstance();
    await pref.setString('lang', newLocale.languageCode);

    notifyListeners();
  }
}
