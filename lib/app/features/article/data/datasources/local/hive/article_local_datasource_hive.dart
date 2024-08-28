import 'dart:async';

import 'package:flutter/foundation.dart' as foundation;
import 'package:hive/hive.dart';
import 'package:news_app/app/core/utils/logger/logger.dart';
import 'package:news_app/app/features/article/data/datasources/local/article_local_datasource.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/article_model.dart';
import 'hive_article.dart';

class ArticlesLocalDatasourceHiveImpl implements ArticleLocalDatasource {
  final _kArticlesBoxName = 'articles_box';

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }

      Hive.registerAdapter(HiveArticleAdapter());
      await Hive.openBox<HiveArticle>(_kArticlesBoxName);
      return true;
    } on Exception catch (e) {
      TLoggerHelper.error(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteDb() async {
    // TODO: implement deleteDb
    throw UnimplementedError();
  }

  @override
  Future<List<ArticleModel>> getArticles() async {
    // return articles hive box
    final articlesBox = Hive.box<HiveArticle>(_kArticlesBoxName);
    return articlesBox.values.map<ArticleModel>((e) {
      return ArticleModel(
          title: e.title,
          content: e.content,
          publishedAt: DateTime.parse(e.publishedAt!),
          url: e.url,
          urlToImage: e.urlToImage);
    }).toList();
  }

  @override
  Future<bool> insertArticles(List<ArticleModel> articles) async {
    try {
      // return articles hive box
      final articlesBox = Hive.box<HiveArticle>(_kArticlesBoxName);
      // clear all enrties from hive box
      final deleted = await articlesBox.clear();
      // print deleted entries
      TLoggerHelper.info(
          'delete $deleted entries from hive $_kArticlesBoxName box');
      // convert ArticleModel to HiveType Article
      final converted = articles
          .map((e) => HiveArticle(
              title: e.title,
              content: e.content,
              publishedAt: e.publishedAt!.toIso8601String(),
              url: e.url,
              urlToImage: e.urlToImage))
          .toList();
      // insert all articles to hive box
      final entries = await articlesBox.addAll(converted);
      TLoggerHelper.info(entries.toString());
      return true;
    } on Exception catch (e) {
      TLoggerHelper.error(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteAllArticles() async {
    try {
      // return articles hive box
      final articlesBox = Hive.box<HiveArticle>(_kArticlesBoxName);
      // clear all enrties from hive box
      final deleted = await articlesBox.clear();
      // print deleted entries
      TLoggerHelper.info(
          'delete $deleted entries from hive $_kArticlesBoxName box');
      return true;
    } on Exception catch (e) {
      TLoggerHelper.error(e.toString());
      return false;
    }
  }
}
