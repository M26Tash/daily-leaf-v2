import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/features/main_page/providers/home_provider/home_provider.dart';
import 'package:daily_leaf/src/features/main_page/widgets/home_page/widgets/home_body.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeProvider>();

    if (state.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: context.theme.primaryColor,
        ),
      );
    }

    if (state.hasError) {
      return Padding(
        padding: const EdgeInsets.all(
          AppDimensions.large,
        ),
        child: Center(
          child: Text(
            state.errorMessage!,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.primaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: HomeBody(
          breakingArticles: state.breakingArticles,
          articles: state.articles,
        ),
      ),
    );
  }
}
