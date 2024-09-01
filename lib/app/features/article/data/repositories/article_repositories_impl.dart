import 'package:dartz/dartz.dart';
import 'package:news_app/app/features/article/data/api/api.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entitites/article.dart';
import '../../domain/repositories/article_repositories.dart';
import '../datasources/local/article_local_datasource.dart';
import '../datasources/remote/article_remote_datasource.dart';

class ArticleRepositoriesImpl implements ArticleRepositories {
  final ArticleLocalDatasource localDatasource;
  final ArticleRemoteDatasource remoteDatasource;

  ArticleRepositoriesImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<Article>>> getRemoteArticles(ArticleCategory category) async {
    final failureOrArticles = await remoteDatasource.getArticles(category);
    return await failureOrArticles.fold(
      (failure) => Left(failure),
      (articles) async {
        if (articles.isNotEmpty) {
          await localDatasource.insertArticles(articles);
          return Right(articles);
        }
        return const Left(
          Failure('Failed to search for articles at this moment'),
        );
      },
    );
  }

  @override
  Future<Either<Failure, List<Article>>> getLocalArticles() async {
    final articles = await localDatasource.getArticles();
    if (articles.isEmpty) {
      return const Left(Failure('You have no cached articles'));
    }
    return Right(articles);
  }
}
