import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/constants/app_fonts.dart';
import 'package:daily_leaf/src/common/constants/font_family.dart';
import 'package:daily_leaf/src/common/localization/localization_extensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/features/main_page/widgets/home_page/widgets/hero_news_item.dart';
import 'package:daily_leaf/src/features/main_page/widgets/home_page/widgets/promo_card.dart';
import 'package:daily_leaf/src/common/widgets/standart_news_item/standart_news_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBody extends StatefulWidget {
  final List<ArticleModel> breakingArticles;
  final List<ArticleModel> articles;

  const HomeBody({
    required this.breakingArticles,
    required this.articles,
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: AppDimensions.none,
          backgroundColor: context.theme.backgroundColor,
          floating: true,
          title: Row(
            children: [
              Text(
                context.locale.dailyLeaf,
                style: context.themeData.textTheme.displayMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                  fontFamily: FontFamily.loraFamily,
                ),
              ),
              Icon(
                Icons.eco_outlined,
                color: context.theme.accentColor,
                size: AppDimensions.leafIconSize,
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                width: context.availableWidth,
                height: AppDimensions.carouselSliderHeight,
                child: CarouselSlider.builder(
                  itemCount: widget.breakingArticles.length,
                  itemBuilder: (context, index, realIndex) => HeroNewsItem(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.large,
                      horizontal: AppDimensions.medium,
                    ),
                    aspectRatio: 16 / 9,
                    article: widget.breakingArticles[index],
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    aspectRatio: 1,
                    onPageChanged: (index, reason) {
                      setState(
                        () => _activeIndex = index,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.medium,
                ),
                child: AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: widget.breakingArticles.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: AppDimensions.indicatorDotSize,
                    dotWidth: AppDimensions.indicatorDotSize,
                    spacing: AppDimensions.indicatorSpacing,
                    dotColor: context.theme.surfaceColor.withValues(
                      alpha: 0.4,
                    ),
                    activeDotColor: context.theme.accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimensions.large,
            ),
            child: Text(
              context.locale.latestNews,
              style: context.themeData.textTheme.displaySmall?.copyWith(
                color: context.theme.primaryTextColor,
                fontWeight: AppFonts.weightBold,
                fontFamily: FontFamily.loraFamily,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final article = widget.articles[index];

              if (index == 3) {
                return const PromoCard();
              }

              final isHero = (index + 1) % 5 == 0;

              if (isHero) {
                return HeroNewsItem(
                  article: article,
                );
              } else {
                return StandartNewsItem(
                  article: article,
                );
              }
            },
            childCount: widget.articles.length,
          ),
        ),
      ],
    );
  }
}
