import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/app/features/article/data/api/api.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entitites/article.dart';
import '../repositories/article_repositories.dart';

class GetRemoteArticlesUsecase extends Usecase<List<Article>, Params> {
  final ArticleRepositories repository;

  GetRemoteArticlesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Article>>> call(Params params) async {
    return await repository.getRemoteArticles(params.category);
  }
}

class Params extends Equatable {
  final ArticleCategory category;
  const Params(this.category);

  @override
  List<Object?> get props => [category];
}
