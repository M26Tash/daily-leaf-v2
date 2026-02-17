import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      margin: const EdgeInsets.all(
        AppDimensions.large,
      ),
      padding: const EdgeInsets.all(
        AppDimensions.extraLarge,
      ),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.large,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.eco_outlined,
            color: theme.backgroundColor,
            size: AppDimensions.leafIconSize,
          ),
          const SizedBox(
            height: AppDimensions.large,
          ),
          Text(
            context.locale.ecoFriendlyNewsEngine,
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.backgroundColor,
              fontWeight: AppFonts.weightBold,
            ),
          ),
          const SizedBox(
            height: AppDimensions.medium,
          ),
          Text(
            context.locale.poweredByGreenEnergy,
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.backgroundColor.withValues(
                alpha: .7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
