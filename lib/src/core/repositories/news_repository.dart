import 'package:daily_leaf/src/core/api_clients/news_api_client.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/core/repositories/interface/i_news_repository.dart';

// final class NewsRepository implements INewsRepository {
//   final NewsApiClient _apiClient;

//   const NewsRepository(this._apiClient);

//   @override
//   Future<List<ArticleModel>> getArticles({
//     String? countryCode,
//     String? localeCode,
//   }) async {
//     final rawData = await _apiClient.fetchNews(
//       country: countryCode,
//       lang: localeCode,
//     );
//     final List<dynamic> articlesList = rawData['articles'];
//     final List<ArticleModel> articles = articlesList
//         .map(
//           (json) => ArticleModel.fromJson(json),
//         )
//         .toList();

//     articles.shuffle();

//     return articles;
//   }
// }

final class NewsRepository implements INewsRepository {
  final NewsApiClient _apiClient;

  const NewsRepository(this._apiClient);

  @override
  Future<List<ArticleModel>> getArticles({
    String? countryCode,
    String? localeCode,
  }) async {
    // Получаем ответ от API
    final rawData = await _apiClient.fetchNews(
      country: countryCode,
      lang: localeCode,
    );

    // Проверяем, есть ли поле 'articles' и является ли оно списком
    final articlesData = rawData;

    final List<ArticleModel> articles = articlesData
        .map(
          (json) => ArticleModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    // Твоя фишка с перемешиванием
    articles.shuffle();

    return articles;
  }
}
