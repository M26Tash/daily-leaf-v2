import 'package:flutter/cupertino.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:daily_leaf/src/core/services/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final AppLocalDatabase _db;

  SettingsProvider(this._db);

  String _currentCountry = 'us';
  String _currentLang = 'en';

  bool _isBreakingNewsEnabled = true;

  String get currentCountry => _currentCountry;
  String get currentLang => _currentLang;
  bool get isBreakingNewsEnabled => _isBreakingNewsEnabled;

  String _appVersion = '';
  String get appVersion => _appVersion;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _currentCountry = prefs.getString('news_country') ?? 'us';
    _currentLang = prefs.getString('news_lang') ?? 'en';
    _isBreakingNewsEnabled = prefs.getBool('breaking_news') ?? true;
    notifyListeners();
  }

  Future<void> updateCountry(String code) async {
    if (_currentCountry == code) return;
    _currentCountry = code;
    _save('news_country', code);
    notifyListeners();
  }

  Future<void> updateLanguage(String code) async {
    if (_currentLang == code) return;
    _currentLang = code;
    _save('news_language', code);
    notifyListeners();
  }

  void toggleBreakingNews(bool value) async {
    _isBreakingNewsEnabled = value;
    _saveBool('breaking_news', value);
    // if (value) {
    //   await LocalNotificationService.showNotification(
    //     title: "Daily Leaf",
    //     body: "Уведомления успешно включены!",
    //   );
    // }
    notifyListeners();
  }

  Future<void> initVersion() async {
    final info = await PackageInfo.fromPlatform();
    _appVersion = '${info.version} (${info.buildNumber})';
    notifyListeners();
  }

  Future<void> _save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> _saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> resetDatabase() async {
    await _db.clearAllArticles();
  }
}
