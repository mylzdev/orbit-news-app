import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entitites/article.dart';

abstract class ArticleRepositories {
  Future<Either<Failure, List<Article>>> getRemoteArticles();
  Future<Either<Failure, List<Article>>> getLocalArticles();
}