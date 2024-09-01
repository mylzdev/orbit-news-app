import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/features/article/data/api/api.dart';
import 'package:news_app/app/features/article/domain/usecases/get_remote_articles_usecase.dart';

import '../../../test_helper.dart';
import '../local/get_local_usecase_test.mocks.dart';

void main() {
  late MockArticleRepositories mockArticleRepositories;
  late GetRemoteArticlesUsecase usecase;

  setUp(() {
    mockArticleRepositories = MockArticleRepositories();
    usecase = GetRemoteArticlesUsecase(mockArticleRepositories);
  });

  test(
    "should get remote articles from ArticleRepository",
    () async {
      when(mockArticleRepositories.getRemoteArticles(any)).thenAnswer(
        (realInvocation) => Future.value(Right(articles)),
      );

      final result = await usecase(const Params(ArticleCategory.general));

      expect(result, Right(articles));
    },
  );

  test(
    "should get failure from the repository",
    () async {
      when(mockArticleRepositories.getRemoteArticles(any)).thenAnswer(
        (realInvocation) => Future.value(const Left(Failure(serverErrorMessage))),
      );

      final result = await usecase(const Params(ArticleCategory.general));

      expect(result, const Left(Failure(serverErrorMessage)));
    },
  );
}
