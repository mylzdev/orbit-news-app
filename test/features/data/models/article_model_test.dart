import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/app/features/article/data/models/article_model.dart';
import 'package:news_app/app/features/article/domain/entitites/article.dart';

void main() {
  final tArticleModel = ArticleModel(
    title: 'test',
    content: 'test',
    publishedAt: DateTime.now(),
    url: 'url',
    urlToImage: 'url',
  );

  test(
    "shold be a subclass of Article Entity",
    () {
      expect(tArticleModel, isA<Article>());
    },
  );

  
}
