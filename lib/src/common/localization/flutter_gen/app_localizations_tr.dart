// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationTr extends AppLocalization {
  AppLocalizationTr([String locale = 'tr']) : super(locale);

  @override
  String get dailyLeaf => 'Daily Leaf';

  @override
  String get latestNews => 'Son Haberler';

  @override
  String get ecoFriendlyNewsEngine => 'Çevre Dostu Haber Motoru';

  @override
  String get poweredByGreenEnergy =>
      'Yeşil Enerji ve GNews API tarafından desteklenmektedir';

  @override
  String get readFullArticle => 'Makalenin tamamını okuyun';

  @override
  String get savedArticles => 'Kaydedilen makaleler';

  @override
  String get noSavedArticles => 'Kaydedilen makale yok';

  @override
  String get articlesYouSaveWillAppearHere =>
      'Kaydettiğiniz makaleler burada görünecek';

  @override
  String get settings => 'Ayarlar';

  @override
  String get appearance => 'Görünüm';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get language => 'Dil';

  @override
  String get content => 'İçerik';

  @override
  String get newsLanguage => 'Haber Dili';

  @override
  String get newsCountry => 'Haber Ülkesi';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get breakingNews => 'Son Dakika Haberleri';

  @override
  String get storage => 'Depolama';

  @override
  String get resetDatabase => 'Veritabanını Sıfırla';

  @override
  String get appLanguage => 'Uygulama Dili';

  @override
  String get app => 'Uygulama';

  @override
  String get version => 'Sürüm';
}
