import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/features/article/data/api/api.dart';
import 'package:news_app/app/features/article/data/api/response_wrapper.dart';
import 'package:news_app/app/features/article/data/datasources/remote/article_remote_datasource.dart';
import 'package:news_app/app/features/article/data/models/article_model.dart';

import 'articles_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RestClient>()])
void main() {
  late MockRestClient client;
  late ArticleRemoteDatasource remoteDatasource;

  setUp(() async {
    // Initialize dotenv before each test
    TestWidgetsFlutterBinding
        .ensureInitialized(); // Ensures Flutter is fully initialized
    await dotenv.load(); // Load environment variables

    client = MockRestClient();
    remoteDatasource = ArticleRemoteDatasource(client: client);
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
    "RestClient",
    () {
      test(
        "should return articles when the call to rest client is successful",
        () async {
          when(client.getTopHeadlines(any, any)).thenAnswer(
            (realInvocation) => Future.value(
              ResponseWrapper(articles: tArticles),
            ),
          );
          final result = await remoteDatasource.getArticles(ArticleCategory.general);

          expect(result, Right(ResponseWrapper(articles: tArticles).articles));
          verify(client.getTopHeadlines(any, any));
          verifyNoMoreInteractions(client);
        },
      );

      test(
        "should return failure when the call to rest client is unsuccessful",
        () async {
          when(client.getTopHeadlines(any, any)).thenThrow(Exception());

          final result = await remoteDatasource.getArticles(ArticleCategory.general);

          expect(result, isA<Left>());
          verify(client.getTopHeadlines(any, any));
          verifyNoMoreInteractions(client);
        },
      );
    },
  );
}
