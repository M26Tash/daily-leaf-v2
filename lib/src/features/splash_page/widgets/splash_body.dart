import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  final Animation<double> animation;

  const SplashBody({
    required this.animation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Icon(
              Icons.eco_rounded,
              size: AppDimensions.splashIconSize,
              color: context.theme.accentColor,
            ),
          ),
          const SizedBox(height: AppDimensions.large),
          Text(
            context.locale.dailyLeaf,
            style: context.themeData.textTheme.displayMedium?.copyWith(
              fontWeight: AppFonts.weightBold,
              color: context.theme.primaryTextColor,
            ),
          ),
          const SizedBox(height: AppDimensions.small),
          Text(
            context.locale.ecoFriendlyNewsEngine,
            style: context.themeData.textTheme.bodyMedium?.copyWith(
              color: context.theme.secondaryTextColor,
            ),
          ),
          const SizedBox(
            height: AppDimensions.superLarge,
          ),
          CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(
              context.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
