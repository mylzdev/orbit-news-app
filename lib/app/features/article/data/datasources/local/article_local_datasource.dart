import '../../models/article_model.dart';

abstract class ArticleLocalDatasource {
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> insertArticles(List<ArticleModel> articles);
  Future<bool> deleteAllArticles();
  Future<List<ArticleModel>> getArticles();
}
