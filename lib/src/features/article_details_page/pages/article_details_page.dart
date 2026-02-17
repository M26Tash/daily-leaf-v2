import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/widgets/custom_button/custom_button.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/features/article_details_page/provider/article_details_provider.dart';
import 'package:daily_leaf/src/features/article_details_page/widgets/article_details_body.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsPage({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleDetailsProvider(
        context.read<AppLocalDatabase>(),
        article.url,
      ),
      child: Consumer<ArticleDetailsProvider>(
        builder: (_, provider, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: context.theme.backgroundColor,
            body: SafeArea(
              child: ArticleDetailsBody(
                article: article,
                isArticleSaved: provider.isSaved,
                onSaveTap: () => provider.toggleBookmark(
                  article,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: CustomButton(
              onPressed: () async {
                await launchUrlString(article.url);
              },
              buttonText: context.locale.readFullArticle.toUpperCase(),
              icon: Icon(
                Icons.open_in_new,
                color: context.theme.backgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
