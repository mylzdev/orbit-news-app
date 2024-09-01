import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/core/usecase/usecase.dart';
import 'package:news_app/app/features/article/data/api/api.dart';
import 'package:news_app/app/features/article/domain/usecases/get_local_articles_usecase.dart';
import 'package:news_app/app/features/article/domain/usecases/get_remote_articles_usecase.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_bloc.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_event.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_state.dart';

import '../../../../test_helper.dart';
import '../../../data/repositories/article_repositories_impl_test.mocks.dart';
import 'article_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetRemoteArticlesUsecase>(),
  MockSpec<GetLocalArticlesUsecase>(),
])
void main() {
  late MockNetworkInfo networkInfo;
  late MockGetRemoteArticlesUsecase remoteArticle;
  late MockGetLocalArticlesUsecase localArticle;
  late ArticleBloc articleBloc;

  const category = ArticleCategory.general;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    remoteArticle = MockGetRemoteArticlesUsecase();
    localArticle = MockGetLocalArticlesUsecase();
    networkInfo = MockNetworkInfo();
    articleBloc = ArticleBloc(
      network: networkInfo,
      remoteUsecase: remoteArticle,
      localUsecase: localArticle,
    );
  });

  group(
    "device online",
    () {
      blocTest<ArticleBloc, ArticleState>(
        'should emits [Loading, Success] when GetData event is called succesfuly',
        build: () {
          when(networkInfo.isConnected).thenAnswer(
            (realInvocation) => Future.value(true),
          );
          when(remoteArticle(const Params(ArticleCategory.general))).thenAnswer(
            (realInvocation) => Future.value(Right(articles)),
          );
          return articleBloc;
        },
        act: (bloc) => bloc.add(const GetData(category)),
        expect: () => [
          const ArticleLoading(),
          ArticleSuccess(articles),
        ],
        verify: (_) {
          verifyInOrder([
            networkInfo.isConnected,
            remoteArticle(const Params(ArticleCategory.general))
          ]);
          verifyNoMoreInteractions(networkInfo);
          verifyNoMoreInteractions(remoteArticle);
          verifyZeroInteractions(localArticle);
        },
      );

      blocTest<ArticleBloc, ArticleState>(
        '''should emits [Loading, Error] when GetData event is called 
        succesfuly and throws a Failure on remoteArticle''',
        build: () {
          when(networkInfo.isConnected).thenAnswer(
            (realInvocation) => Future.value(true),
          );
          when(remoteArticle(const Params(category))).thenAnswer(
            (realInvocation) =>
                Future.value(const Left(Failure(serverErrorMessage))),
          );
          return articleBloc;
        },
        act: (bloc) => bloc.add(const GetData(category)),
        expect: () => [
          const ArticleLoading(),
          const ArticleError(Failure(serverErrorMessage))
        ],
        verify: (_) {
          verifyInOrder(
              [networkInfo.isConnected, remoteArticle(const Params(category))]);
          verifyNoMoreInteractions(networkInfo);
          verifyNoMoreInteractions(remoteArticle);
          verifyZeroInteractions(localArticle);
        },
      );
      blocTest<ArticleBloc, ArticleState>(
        'should immedietly trigger [ArticleSuccess] if the ArticleCategory is already loaded',
        build: () {
          articleBloc.cachedArticles[category] = articles;
          return articleBloc;
        },
        act: (bloc) => bloc.add(const GetData(category)),
        expect: () => [ArticleSuccess(articles)],
        verify: (bloc) {
          verifyZeroInteractions(remoteArticle);
          verifyZeroInteractions(localArticle);
          verifyZeroInteractions(networkInfo);
        },
      );
    },
  );

  group(
    "device is offline",
    () {
      blocTest<ArticleBloc, ArticleState>(
        'should emits [Loading, Success] when GetData event is called succesfuly.',
        build: () {
          when(networkInfo.isConnected).thenAnswer(
            (realInvocation) => Future.value(false),
          );
          when(localArticle(NoParams())).thenAnswer(
            (realInvocation) => Future.value(Right(articles)),
          );
          return articleBloc;
        },
        act: (bloc) => bloc.add(const GetData(category)),
        expect: () => [const ArticleLoading(), ArticleSuccess(articles)],
        verify: (_) {
          verifyInOrder([
            networkInfo.isConnected,
            localArticle(NoParams()),
            networkInfo.internetConnectionStatus,
          ]);
          verifyNoMoreInteractions(networkInfo);
          verifyNoMoreInteractions(localArticle);
          verifyZeroInteractions(remoteArticle);
        },
      );

      blocTest<ArticleBloc, ArticleState>(
        'should emits [Loading, Error] when GetData event is called unsuccesful.',
        build: () {
          when(networkInfo.isConnected).thenAnswer(
            (realInvocation) => Future.value(false),
          );
          when(localArticle(NoParams())).thenAnswer(
            (realInvocation) =>
                Future.value(const Left(Failure(cacheErrorMessage))),
          );
          return articleBloc;
        },
        act: (bloc) => bloc.add(const GetData(category)),
        expect: () => [
          const ArticleLoading(),
          const ArticleError(Failure(cacheErrorMessage))
        ],
        verify: (_) {
          verifyInOrder([
            networkInfo.isConnected,
            localArticle(NoParams()),
            networkInfo.internetConnectionStatus,
          ]);
          verifyNoMoreInteractions(networkInfo);
          verifyNoMoreInteractions(localArticle);
          verifyZeroInteractions(remoteArticle);
        },
      );
    },
  );
}
