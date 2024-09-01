import 'package:dartz/dartz.dart';
import 'package:news_app/app/features/article/data/api/api.dart';

import '../../../../core/errors/failure.dart';
import '../entitites/article.dart';

abstract class ArticleRepositories {
  Future<Either<Failure, List<Article>>> getRemoteArticles(ArticleCategory category);
  Future<Either<Failure, List<Article>>> getLocalArticles();
}