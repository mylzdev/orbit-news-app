import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entitites/article.dart';
import '../repositories/article_repositories.dart';

class GetRemoteArticlesUsecase extends Usecase<List<Article>, NoParams> {
  final ArticleRepositories repository;

  GetRemoteArticlesUsecase(this.repository);
  
  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) async {
    return await repository.getRemoteArticles();
  }
}
