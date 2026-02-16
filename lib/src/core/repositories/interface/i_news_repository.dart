import 'package:flutter/material.dart';
import 'package:news_app/src/core/models/article_model/article_model.dart';

abstract interface class INewsRepository {
  Future<List<ArticleModel>> getArticles({Locale? locale});
}
