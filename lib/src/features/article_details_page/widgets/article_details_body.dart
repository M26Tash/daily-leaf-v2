import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/constants/font_family.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/utils/date_time_extension.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';

class ArticleDetailsBody extends StatelessWidget {
  final ArticleModel article;
  final bool isArticleSaved;
  final VoidCallback onSaveTap;

  const ArticleDetailsBody({
    required this.article,
    required this.isArticleSaved,
    required this.onSaveTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: AppDimensions.articleDetailsAppBarHeight,
          stretch: true,
          pinned: true,
          backgroundColor: context.theme.primaryColor,
          leading: _ArticleAppBarIcon(
            icon: Icons.arrow_back,
            onTap: () => Navigator.pop(context),
          ),
          actions: [
            _ArticleAppBarIcon(
              icon: isArticleSaved ? Icons.bookmark : Icons.bookmark_border,
              onTap: onSaveTap,
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: article.image,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.broken_image_rounded,
                    color: context.theme.accentColor,
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    AppDimensions.largeBorderRadius,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.large,
                vertical: AppDimensions.extraLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppDimensions.large),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.preLarge,
                          vertical: AppDimensions.medium,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.accentColor.withValues(
                            alpha: .1,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.mediumBorderRadius,
                          ),
                        ),
                        child: Text(
                          article.source.name.toUpperCase(),
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                                color: context.theme.accentColor,
                                fontSize: AppFonts.sizeTitleMedium,
                                fontWeight: AppFonts.weightBold,
                              ),
                        ),
                      ),
                      Text(
                        article.publishedAt.format(),
                        style: context.themeData.textTheme.bodySmall?.copyWith(
                          color: context.theme.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppDimensions.large,
                  ),
                  Text(
                    article.title,
                    style: context.themeData.textTheme.displaySmall?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontFamily: FontFamily.loraFamily,
                      fontWeight: AppFonts.weightBold,
                      height: AppFonts.sizeFactorLarge,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.large,
                  ),
                  Divider(
                    color: context.theme.surfaceColor.withValues(
                      alpha: .3,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.large,
                  ),
                  Text(
                    article.description,
                    style: context.themeData.textTheme.titleMedium?.copyWith(
                      color: context.theme.primaryTextColor.withValues(
                        alpha: .8,
                      ),
                      fontWeight: AppFonts.weightMedium,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    article.content,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.superLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ArticleAppBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArticleAppBarIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppDimensions.medium,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: IconButton(
          icon: Icon(
            icon,
            color: context.theme.lightIconColor,
            size: AppDimensions.smallIconSize,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
