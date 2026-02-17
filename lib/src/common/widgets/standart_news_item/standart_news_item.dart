import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/constants/font_family.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/utils/date_time_extension.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/features/article_details_page/pages/article_details_page.dart';

class StandartNewsItem extends StatelessWidget {
  final ArticleModel article;

  const StandartNewsItem({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.medium,
      ),
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDimensions.mediumBorderRadius,
                ),
                child: Container(
                  width: AppDimensions.standartNewsDimensions,
                  height: AppDimensions.standartNewsDimensions,
                  color: context.theme.surfaceColor.withValues(
                    alpha: 0.2,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: article.image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(
                      Icons.newspaper,
                      color: context.theme.accentColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: AppDimensions.large,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.source.name.toUpperCase(),
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                                color: context.theme.accentColor,
                                fontSize: AppFonts.sizeTitleMedium,
                                fontWeight: AppFonts.weightBold,
                                letterSpacing: AppFonts.sizeFactorSmall,
                              ),
                        ),
                        const SizedBox(height: AppDimensions.small),
                        Text(
                          article.title,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                                color: context.theme.primaryTextColor,
                                fontWeight: AppFonts.weightBold,
                                height: AppFonts.sizeFactorLarge,
                                fontFamily: FontFamily.loraFamily,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      article.publishedAt.format(),
                      style: context.themeData.textTheme.headlineSmall
                          ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                            fontSize: AppFonts.sizeTitleMedium,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
