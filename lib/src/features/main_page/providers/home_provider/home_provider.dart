import 'package:flutter/foundation.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:daily_leaf/src/core/repositories/interface/i_news_repository.dart';

class HomeProvider extends ChangeNotifier {
  final INewsRepository _repository;

  HomeProvider({required INewsRepository repository})
    : _repository = repository {
    fetchNews();
  }

  List<ArticleModel> _allArticles = [];
  List<ArticleModel> _breakingArticles = [];
  List<ArticleModel> _articles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ArticleModel> get allArticles => _allArticles;
  List<ArticleModel> get breakingArticles => _breakingArticles;
  List<ArticleModel> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  Future<void> fetchNews({
    String? countryCode,
    String? localeCode,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _allArticles = await _repository.getArticles(
        countryCode: countryCode,
        localeCode: localeCode,
      );
      _breakingArticles = _allArticles.take(5).toList();
      _articles = _allArticles.skip(5).toList();
    } catch (e) {
      _errorMessage = 'Failed to load news. Check your connection.';
      if (kDebugMode) {
        print('HomeProvider Error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
