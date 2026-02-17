import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
abstract class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required String title,
    required String description,
    required String content,
    required String url,
    required String image,
    required DateTime publishedAt,
    required SourceModel source,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

@freezed
abstract class SourceModel with _$SourceModel {
  const factory SourceModel({required String name, required String url}) =
      _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}

extension ArticleModelX on ArticleModel {
  LocalArticle toLocal() {
    return LocalArticle(
      title: title,
      description: description,
      content: content,
      url: url,
      image: image,
      publishedAt: publishedAt,
      sourceName: source.name,
      sourceUrl: source.url,
    );
  }
}
