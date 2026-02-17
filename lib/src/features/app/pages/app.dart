import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:daily_leaf/src/common/shared_providers/app_theme_provider/app_theme_provider.dart';
import 'package:daily_leaf/src/common/shared_providers/navigation_panel_provider/navigation_panel_provider.dart';
import 'package:daily_leaf/src/common/theme/app_theme.dart';
import 'package:daily_leaf/src/common/theme/theme_provider.dart';
import 'package:daily_leaf/src/core/api_clients/news_api_client.dart';
import 'package:daily_leaf/src/common/shared_providers/locale_provider/locale_provider.dart';
import 'package:daily_leaf/src/common/localization/flutter_gen/app_localizations.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:daily_leaf/src/core/repositories/interface/i_news_repository.dart';
import 'package:daily_leaf/src/core/repositories/news_repository.dart';
import 'package:daily_leaf/src/features/main_page/providers/home_provider/home_provider.dart';
import 'package:daily_leaf/src/features/main_page/providers/settings_provider/settings_provider.dart';
import 'package:daily_leaf/src/features/splash_page/pages/splash_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationPanelProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocaleProvider()..loadSavedLocale(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppThemeProvider(),
        ),
        Provider<AppLocalDatabase>(
          create: (_) => AppLocalDatabase(),
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SettingsProvider(
                  context.read<AppLocalDatabase>(),
                )
                ..loadSettings()
                ..initVersion(),
        ),

        Provider(
          create: (_) => NewsApiClient(),
        ),
        Provider<INewsRepository>(
          create: (context) => NewsRepository(
            context.read<NewsApiClient>(),
          ),
        ),
        ChangeNotifierProxyProvider<SettingsProvider, HomeProvider>(
          create: (context) => HomeProvider(
            repository: context.read<INewsRepository>(),
          ),
          update: (context, settings, home) {
            return home!..fetchNews(
              countryCode: settings.currentCountry,
              localeCode: settings.currentLang,
            );
          },
        ),
      ],
      builder: (context, child) {
        final localeModel = context.watch<LocaleProvider>();
        final themeModel = context.watch<AppThemeProvider>();

        final currentTheme = themeModel.currentTheme;

        return ThemeProvider(
          theme: currentTheme,
          themeData: generateThemeData(currentTheme),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: localeModel.locale,
            localizationsDelegates: const [
              LocaleNamesLocalizationsDelegate(),
              ...AppLocalization.localizationsDelegates,
            ],
            supportedLocales: AppLocalization.supportedLocales,
            theme: ThemeData(useMaterial3: true),
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
