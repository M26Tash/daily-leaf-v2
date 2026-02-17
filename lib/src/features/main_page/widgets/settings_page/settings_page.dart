import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/features/main_page/widgets/settings_page/widgets/settings_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.theme.transparent,
        title: Text(
          context.locale.settings,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontWeight: AppFonts.weightBold,
          ),
        ),
      ),
      body: SettingsBody(),
    );
  }
}
