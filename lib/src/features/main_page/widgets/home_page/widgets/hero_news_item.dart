import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/constants/font_family.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/features/article_details_page/pages/article_details_page.dart';

class HeroNewsItem extends StatelessWidget {
  final ArticleModel article;
  final double? aspectRatio;
  final EdgeInsetsGeometry? padding;

  const HeroNewsItem({
    required this.article,
    this.aspectRatio,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 16 / 11,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppDimensions.large),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.largeBorderRadius,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: article.url,
                  child: CachedNetworkImage(
                    imageUrl: article.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: context.theme.surfaceColor.withValues(
                        alpha: 0.2,
                      ),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.theme.accentColor,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: context.theme.surfaceColor.withValues(
                        alpha: 0.2,
                      ),
                      child: Icon(
                        Icons.broken_image,
                        color: context.theme.accentColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.theme.transparent,
                        context.theme.primaryColor.withValues(
                          alpha: .9,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.large,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.source.name.toUpperCase(),
                        style: context.themeData.textTheme.headlineSmall
                            ?.copyWith(
                              color: context.theme.accentColor,
                              fontWeight: AppFonts.weightBold,
                              letterSpacing: AppFonts.sizeFactorLarge,
                            ),
                      ),
                      const SizedBox(
                        height: AppDimensions.medium,
                      ),
                      Text(
                        article.title,
                        style: context.themeData.textTheme.displaySmall
                            ?.copyWith(
                              color: context.theme.backgroundColor,
                              fontWeight: AppFonts.weightBold,
                              fontFamily: FontFamily.loraFamily,
                            ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: context.theme.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailsPage(
                            article: article,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
