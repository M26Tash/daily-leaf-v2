import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/flutter_gen/app_localizations.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/shared_providers/locale_provider/locale_provider.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/utils/string_extension.dart';

class LanguageItem extends StatelessWidget {
  final LocaleProvider localeProvider;

  const LanguageItem({
    required this.localeProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppLocalization.supportedLocales.map((language) {
        final isSelected = context.locale.localeName == language.languageCode;

        return Padding(
          padding: const EdgeInsets.only(
            bottom: AppDimensions.small,
          ),
          child: Material(
            color: isSelected
                ? context.theme.accentColor.withValues(
                    alpha: 0.1,
                  )
                : context.theme.transparent,
            borderRadius: BorderRadius.circular(
              AppDimensions.mediumBorderRadius,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                AppDimensions.mediumBorderRadius,
              ),
              onTap: () {
                localeProvider.setLocale(language);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.large),
                child: Row(
                  children: [
                    CountryFlag.fromLanguageCode(
                      language.languageCode,
                    ),
                    const SizedBox(width: AppDimensions.large),
                    Expanded(
                      child: Text(
                        '${LocaleNames.of(context)?.nameOf(language.languageCode)?.capitalize()}',
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
      }).toList(),
    );
  }
}
