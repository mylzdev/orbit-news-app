import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/core/network/network_info.dart';
import 'package:news_app/app/features/article/data/api/api.dart';
import 'package:news_app/app/features/article/data/datasources/local/article_local_datasource.dart';
import 'package:news_app/app/features/article/data/datasources/remote/article_remote_datasource.dart';
import 'package:news_app/app/features/article/data/models/article_model.dart';
import 'package:news_app/app/features/article/data/repositories/article_repositories_impl.dart';

import 'article_repositories_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ArticleLocalDatasource>(),
  MockSpec<ArticleRemoteDatasource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  late MockArticleLocalDatasource mockLocalDatasource;
  late MockArticleRemoteDatasource mockRemoteDatasource;
  late ArticleRepositoriesImpl repository;

  setUp(() {
    mockLocalDatasource = MockArticleLocalDatasource();
    mockRemoteDatasource = MockArticleRemoteDatasource();
    repository = ArticleRepositoriesImpl(
      localDatasource: mockLocalDatasource,
      remoteDatasource: mockRemoteDatasource,
    );
  });

  final tArticles = <ArticleModel>[
    ArticleModel(
        title: 'test',
        content: 'test',
        publishedAt: DateTime.now(),
        url: 'url',
        urlToImage: 'url')
  ];
  group(
    "remote articles",
    () {
      test(
        "should return articles when the call to remoteDataSource is succesful, and insert articles to localDataSource",
        () async {
          when(mockRemoteDatasource.getArticles(any)).thenAnswer(
            (realInvocation) async => Right(tArticles),
          );

          final result = await repository.getRemoteArticles(ArticleCategory.general);

          expect(result, Right(tArticles));
          verify(mockRemoteDatasource.getArticles(any));
          verify(mockLocalDatasource.insertArticles(tArticles));
          verifyNoMoreInteractions(mockRemoteDatasource);
          verifyNoMoreInteractions(mockLocalDatasource);
        },
      );

      test(
        "should return failure when the call to remoteDataSource is unsuccesful",
        () async {
          when(mockRemoteDatasource.getArticles(any)).thenAnswer(
            (realInvocation) async => const Left(Failure(serverErrorMessage)),
          );

          final result = await repository.getRemoteArticles(ArticleCategory.general);

          expect(result, const Left(Failure(serverErrorMessage)));
          verify(mockRemoteDatasource.getArticles(any));
          verifyNoMoreInteractions(mockRemoteDatasource);
          verifyZeroInteractions(mockLocalDatasource);
        },
      );
    },
  );

  group(
    "local articles",
    () {
      test(
        "should return articles data when the call to localDataSource return with none empty or null data",
        () async {
          when(mockLocalDatasource.getArticles()).thenAnswer(
            (realInvocation) => Future.value(tArticles),
          );

          final result = await repository.getLocalArticles();

          expect(result, Right(tArticles));
          verify(mockLocalDatasource.getArticles());
        },
      );

      test(
        "should return failure when the call to localDataSource return empty or null data",
        () async {
          when(mockLocalDatasource.getArticles()).thenAnswer(
            (realInvocation) => Future.value([]),
          );

          final result = await repository.getLocalArticles();

          expect(result, isA<Left>());
          verify(mockLocalDatasource.getArticles());
          verifyNoMoreInteractions(mockLocalDatasource);
        },
      );
    },
  );
}
