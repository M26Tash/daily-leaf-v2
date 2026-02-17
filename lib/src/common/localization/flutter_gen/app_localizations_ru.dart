// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationRu extends AppLocalization {
  AppLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get dailyLeaf => 'Daily Leaf';

  @override
  String get latestNews => 'Последние новости';

  @override
  String get ecoFriendlyNewsEngine => 'Экологически чистый новостной движок';

  @override
  String get poweredByGreenEnergy =>
      'Работает на основе Green Energy и API GNews';

  @override
  String get readFullArticle => 'Читать полную статью';

  @override
  String get savedArticles => 'Сохраненные статьи';

  @override
  String get noSavedArticles => 'Сохраненные статьи отсутствуют';

  @override
  String get articlesYouSaveWillAppearHere =>
      'Сохраненные вами статьи будут отображаться здесь';

  @override
  String get settings => 'Настройки';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get darkMode => 'Темный режим';

  @override
  String get language => 'Язык';

  @override
  String get content => 'Содержание';

  @override
  String get newsLanguage => 'Язык новостей';

  @override
  String get newsCountry => 'Страна новостей';

  @override
  String get notifications => 'Уведомления';

  @override
  String get breakingNews => 'Срочные новости';

  @override
  String get storage => 'Хранилище';

  @override
  String get resetDatabase => 'Сбросить базу данных';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String get app => 'Приложение';

  @override
  String get version => 'Версия';
}
