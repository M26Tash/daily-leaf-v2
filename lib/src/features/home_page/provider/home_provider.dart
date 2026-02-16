import 'package:flutter/foundation.dart';
import 'package:news_app/src/core/models/article_model/article_model.dart';
import 'package:news_app/src/core/repositories/interface/i_news_repository.dart';

class HomeProvider extends ChangeNotifier {
  final INewsRepository _repository;

  HomeProvider({required INewsRepository repository})
    : _repository = repository {
    fetchNews();
  }

  List<ArticleModel> _articles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ArticleModel> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  Future<void> fetchNews() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _repository.getArticles();
    } catch (e) {
      _errorMessage = 'Не удалось загрузить новости. Проверьте соединение.';
      if (kDebugMode) {
        print('HomeProvider Error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
