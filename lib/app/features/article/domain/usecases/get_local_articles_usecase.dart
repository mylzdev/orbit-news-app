// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/core/usecase/usecase.dart';
import 'package:news_app/app/features/article/domain/entitites/article.dart';
import 'package:news_app/app/features/article/domain/repositories/article_repositories.dart';

class GetLocalArticlesUsecase extends Usecase<List<Article>, NoParams> {
  ArticleRepositories repository;
  GetLocalArticlesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) async {
    return await repository.getLocalArticles();
  }
}
