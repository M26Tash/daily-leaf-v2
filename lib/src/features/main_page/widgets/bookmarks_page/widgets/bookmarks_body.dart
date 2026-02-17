import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/common/widgets/standart_news_item/standart_news_item.dart';

class BookmarksBody extends StatelessWidget {
  final List<ArticleModel> savedArticles;

  const BookmarksBody({
    required this.savedArticles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (savedArticles.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(
          AppDimensions.large,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_border_rounded,
                size: AppDimensions.bookmarkIconSize,
                color: context.theme.accentColor.withValues(
                  alpha: 0.3,
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Text(
                context.locale.noSavedArticles.toUpperCase(),
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.small),
              Text(
                context.locale.articlesYouSaveWillAppearHere,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: savedArticles.length,
      itemBuilder: (context, index) => StandartNewsItem(
        article: savedArticles[index],
      ),
    );
  }
}
