import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';

class ArticleDetailsProvider extends ChangeNotifier {
  final AppLocalDatabase _db;
  final String articleUrl;

  bool _isSaved = false;
  bool get isSaved => _isSaved;

  StreamSubscription<bool>? _subscription;

  ArticleDetailsProvider(this._db, this.articleUrl) {
    _observeStatus();
  }

  void _observeStatus() {
    _subscription = _db.isSaved(articleUrl).listen((status) {
      _isSaved = status;
      notifyListeners();
    });
  }

  Future<void> toggleBookmark(ArticleModel article) async {
    if (_isSaved) {
      await _db.deleteArticle(article.url);
    } else {
      await _db.saveArticle(article.toLocal());
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
