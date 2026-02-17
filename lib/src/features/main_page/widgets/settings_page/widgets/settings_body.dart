import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/news_data.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/shared_providers/app_theme_provider/app_theme_provider.dart';
import 'package:daily_leaf/src/common/shared_providers/locale_provider/locale_provider.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/widgets/support_methods/support_methods.dart';
import 'package:daily_leaf/src/features/main_page/providers/settings_provider/settings_provider.dart';
import 'package:daily_leaf/src/features/main_page/widgets/settings_page/widgets/language_item.dart';
import 'package:daily_leaf/src/features/main_page/widgets/settings_page/widgets/news_country_item.dart';
import 'package:daily_leaf/src/features/main_page/widgets/settings_page/widgets/news_language_item.dart';
import 'package:daily_leaf/src/features/main_page/widgets/settings_page/widgets/settings_section.dart';
import 'package:provider/provider.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  Future<void> _showLanguageBottomSheet(BuildContext context) {
    final localeProvider = context.read<LocaleProvider>();

    return SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: context.locale.appLanguage,
      child: LanguageItem(
        localeProvider: localeProvider,
      ),
    );
  }

  Future<void> _showCountryBottomSheet(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final countries = NewsData.supportedCountries.entries.toList();

    return SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: context.locale.newsCountry,
      child: NewsCountryItem(
        countries: countries,
        settingsProvider: settingsProvider,
      ),
    );
  }

  Future<void> _showNewsLanguageBottomSheet(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final languages = NewsData.supportedLocales.entries.toList();

    return SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: context.locale.newsLanguage,
      child: NewsLanguageItem(
        languages: languages,
        settingsProvider: settingsProvider,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final settingsProvider = context.watch<SettingsProvider>();

    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        SettingsSection(
          title: context.locale.appearance.toUpperCase(),
          items: [
            SettingsItem(
              icon: Icons.dark_mode_outlined,
              title: context.locale.darkMode,
              trailing: Switch.adaptive(
                value: themeProvider.isDark,
                onChanged: (v) => themeProvider.toggleTheme(),
                activeThumbColor: context.theme.accentColor,
                inactiveTrackColor: context.theme.lightIconColor,
              ),
            ),
            SettingsItem(
              icon: Icons.translate_rounded,
              title: context.locale.language,
              onTap: () => _showLanguageBottomSheet(
                context,
              ),
            ),
          ],
        ),
        SettingsSection(
          title: context.locale.content,
          items: [
            SettingsItem(
              icon: Icons.language_rounded,
              title: context.locale.newsLanguage,
              onTap: () => _showNewsLanguageBottomSheet(
                context,
                settingsProvider,
              ),
            ),
            SettingsItem(
              icon: Icons.public_rounded,
              title: context.locale.newsCountry,
              onTap: () => _showCountryBottomSheet(
                context,
                settingsProvider,
              ),
            ),
          ],
        ),
        SettingsSection(
          title: context.locale.notifications,
          items: [
            SettingsItem(
              icon: Icons.notifications_active_outlined,
              title: context.locale.breakingNews,
              trailing: Switch.adaptive(
                value: settingsProvider.isBreakingNewsEnabled,
                onChanged: (v) => settingsProvider.toggleBreakingNews(v),
                activeThumbColor: context.theme.accentColor,
                inactiveTrackColor: context.theme.lightIconColor,
              ),
            ),
          ],
        ),
        SettingsSection(
          title: context.locale.storage,
          items: [
            SettingsItem(
              icon: Icons.delete_outline_rounded,
              title: context.locale.resetDatabase,
              onTap: settingsProvider.resetDatabase,
            ),
          ],
        ),
        SettingsSection(
          title: context.locale.app,
          items: [
            SettingsItem(
              icon: Icons.info_outline_rounded,
              title: context.locale.version,
              trailing: Text(
                settingsProvider.appVersion,
                style: TextStyle(
                  color: context.theme.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
