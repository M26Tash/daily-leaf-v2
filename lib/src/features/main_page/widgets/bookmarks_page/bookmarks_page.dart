import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:daily_leaf/src/features/main_page/providers/bookmarks_provider/bookmarks_provider.dart';
import 'package:daily_leaf/src/features/main_page/widgets/bookmarks_page/widgets/bookmarks_body.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarksProvider(
        context.read<AppLocalDatabase>(),
      ),
      child: Consumer<BookmarksProvider>(
        builder: (_, provider, _) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: context.theme.transparent,
              title: Text(
                context.locale.savedArticles,
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            ),
            body: BookmarksBody(
              savedArticles: provider.articles,
            ),
          );
        },
      ),
    );
  }
}
