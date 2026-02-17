import 'package:daily_leaf/src/core/models/article_model/article_model.dart';

abstract interface class INewsRepository {
  Future<List<ArticleModel>> getArticles({
    String? countryCode,
    String? localeCode,
  });
}
