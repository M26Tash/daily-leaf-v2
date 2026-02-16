import 'package:flutter/material.dart';
import 'package:news_app/src/core/api_clients/news_api_client.dart';
import 'package:news_app/src/core/models/article_model/article_model.dart';
import 'package:news_app/src/core/repositories/interface/i_news_repository.dart';

final class NewsRepository implements INewsRepository {
  final NewsApiClient _apiClient;

  const NewsRepository(this._apiClient);

  @override
  Future<List<ArticleModel>> getArticles({Locale? locale}) async {
    final rawData = await _apiClient.fetchRawNews();
    final List<dynamic> articlesList = rawData['articles'];

    return articlesList.map((json) => ArticleModel.fromJson(json)).toList();
  }
}
