import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/core/usecase/usecase.dart';
import 'package:news_app/app/features/article/domain/repositories/article_repositories.dart';
import 'package:news_app/app/features/article/domain/usecases/get_local_articles_usecase.dart';

import '../../../test_helper.dart';
import 'get_local_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ArticleRepositories>()])
void main() {
  late MockArticleRepositories mockArticleRepositories;
  late GetLocalArticlesUsecase usecase;

  setUp(() {
    mockArticleRepositories = MockArticleRepositories();
    usecase = GetLocalArticlesUsecase(mockArticleRepositories);
  });

  test(
    "should get local articles from ArticleRepository",
    () async {
      when(mockArticleRepositories.getLocalArticles()).thenAnswer(
        (realInvocation) => Future.value(Right(articles)),
      );

      final result = await usecase(NoParams());

      expect(result, Right(articles));
      verify(mockArticleRepositories.getLocalArticles());
      verifyNoMoreInteractions(mockArticleRepositories);
    },
  );

  test(
    "should get failure from the repository",
    () async {
      when(mockArticleRepositories.getLocalArticles()).thenAnswer(
        (realInvocation) => Future.value(const Left(Failure(cacheErrorMessage))),
      );

      final result = await usecase(NoParams());

      expect(result, equals(const Left(Failure(cacheErrorMessage))));
      verify(mockArticleRepositories.getLocalArticles());
      verifyNoMoreInteractions(mockArticleRepositories);      
    },
  );
}
