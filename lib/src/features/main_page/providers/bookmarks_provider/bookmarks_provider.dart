import 'dart:async';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/core/database/app_local_database.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';

class BookmarksProvider extends ChangeNotifier {
  final AppLocalDatabase _db;

  BookmarksProvider(this._db) {
    _init();
  }

  List<ArticleModel> _allArticles = [];
  StreamSubscription<List<dynamic>>? _subscription;

  List<ArticleModel> get articles => _allArticles;

  void _init() {
    _subscription = _db.watchSavedArticles().listen((localList) {
      _allArticles = localList.map((entity) => entity.toModel()).toList();

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
