import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/common/utils/date_time_extension.dart';
import 'package:news_app/src/common/widgets/loading_widgets/article_loading.dart';
import 'package:news_app/src/core/models/article_model/article_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePageAllNews extends StatelessWidget {
  final List<ArticleModel>? articles;

  const HomePageAllNews({
    required this.articles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return articles?.length != null
        ? ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AllNewsItem(
              article: articles?[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: articles!.length,
          )
        : ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ArticleLoading(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: 10,
          );
  }
}

class AllNewsItem extends StatelessWidget {
  final ArticleModel? article;

  const AllNewsItem({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        await launchUrlString(article?.url ?? '');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: article?.image != null
                  ? CachedNetworkImage(
                      height: 200,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      imageUrl: article!.image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                    )
                  : const SizedBox(
                      height: 250,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              article?.title ?? '',
              maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 0.9,
                wordSpacing: 5,
              ),
            ),
            const Spacer(),
            Text(article?.publishedAt.format() ?? ''),
          ],
        ),
      ),
    );
  }
}
