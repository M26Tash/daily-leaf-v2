// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/src/common/shared_providers/app_theme_provider/app_theme_provider.dart';
import 'package:news_app/src/common/theme/app_theme.dart';
import 'package:news_app/src/common/theme/news_theme.dart';
import 'package:news_app/src/common/theme/theme_provider.dart';
import 'package:news_app/src/core/api_clients/news_api_client.dart';
import 'package:news_app/src/common/shared_providers/locale_provider/locale_provider.dart';
import 'package:news_app/src/common/localization/flutter_gen/app_localizations.dart';
import 'package:news_app/src/core/repositories/interface/i_news_repository.dart';

import 'package:news_app/src/core/repositories/news_repository.dart';
import 'package:news_app/src/features/home_page/pages/home_page.dart';
import 'package:news_app/src/features/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppThemeProvider(),
        ),
        Provider(
          create: (_) => NewsApiClient(),
        ),
        Provider<INewsRepository>(
          create: (context) => NewsRepository(
            context.read<NewsApiClient>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            repository: context.read<INewsRepository>(),
          ),
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
            localizationsDelegates: AppLocalization.localizationsDelegates,
            supportedLocales: AppLocalization.supportedLocales,
            theme: ThemeData(useMaterial3: true),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
