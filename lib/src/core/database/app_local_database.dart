import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:daily_leaf/src/core/models/article_model/article_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_local_database.g.dart';

@DataClassName('LocalArticle')
class Articles extends Table {
  @override
  Set<Column> get primaryKey => {url};

  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get content => text()();
  TextColumn get url => text()();
  TextColumn get image => text()();
  DateTimeColumn get publishedAt => dateTime()();

  TextColumn get sourceName => text()();
  TextColumn get sourceUrl => text()();
}

@DriftDatabase(tables: [Articles])
class AppLocalDatabase extends _$AppLocalDatabase {
  AppLocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<LocalArticle>> watchSavedArticles() => select(articles).watch();

  Future<void> saveArticle(LocalArticle article) => into(articles).insert(
    article,
    mode: InsertMode.insertOrReplace,
  );

  Future<void> deleteArticle(String url) =>
      (delete(articles)..where((t) => t.url.equals(url))).go();

  Stream<bool> isSaved(String url) {
    return (select(
      articles,
    )..where((t) => t.url.equals(url))).watch().map(
      (list) => list.isNotEmpty,
    );
  }

  Future<void> clearAllArticles() async {
    await delete(articles).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(
        dbFolder.path,
        'db.sqlite',
      ),
    );

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = await getTemporaryDirectory();
    sqlite3.tempDirectory = cachebase.path;

    return NativeDatabase.createInBackground(file);
  });
}

extension LocalArticleX on LocalArticle {
  ArticleModel toModel() {
    return ArticleModel(
      title: title,
      description: description,
      content: content,
      url: url,
      image: image,
      publishedAt: publishedAt,
      source: SourceModel(
        name: sourceName,
        url: sourceUrl,
      ),
    );
  }
}
