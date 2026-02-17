import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/features/main_page/providers/settings_provider/settings_provider.dart';

class NewsLanguageItem extends StatelessWidget {
  final List<MapEntry<String, String>> languages;
  final SettingsProvider settingsProvider;

  const NewsLanguageItem({
    required this.languages,
    required this.settingsProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.availableHeight * 0.5,
      child: ListView.builder(
        itemCount: languages.length,
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.small),
        itemBuilder: (context, index) {
          final entry = languages[index];
          final isSelected = settingsProvider.currentLang == entry.key;

          return Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.small),
            child: Material(
              color: isSelected
                  ? context.theme.accentColor.withValues(alpha: 0.1)
                  : context.theme.transparent,
              borderRadius: BorderRadius.circular(
                AppDimensions.mediumBorderRadius,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  AppDimensions.mediumBorderRadius,
                ),
                onTap: () {
                  settingsProvider.updateLanguage(
                    entry.key,
                  );

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.large),
                  child: Row(
                    children: [
                      Icon(
                        Icons.translate_rounded,
                        size: AppDimensions.smallIconSize,
                        color: isSelected
                            ? context.theme.accentColor
                            : context.theme.lightIconColor,
                      ),
                      const SizedBox(width: AppDimensions.large),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                                color: isSelected
                                    ? context.theme.accentColor
                                    : context.theme.primaryTextColor,
                                fontWeight: isSelected
                                    ? AppFonts.weightBold
                                    : AppFonts.weightRegular,
                              ),
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: context.theme.accentColor,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
