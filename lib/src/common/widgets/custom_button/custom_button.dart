import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';

final class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget? icon;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final EdgeInsets? margin;

  const CustomButton({
    required this.buttonText,
    this.icon,
    this.onPressed,
    this.textStyle,
    this.buttonColor,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
          margin ??
          const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
          ),
      child: FloatingActionButton.extended(
        backgroundColor: buttonColor ?? context.theme.primaryColor,
        elevation: 4,
        onPressed: onPressed,
        label: Text(
          buttonText,
          style:
              textStyle ??
              context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.backgroundColor,
                fontWeight: AppFonts.weightBold,
              ),
        ),
        icon: icon,
      ),
    );
  }
}
