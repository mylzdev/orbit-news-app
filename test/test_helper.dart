import 'package:news_app/app/features/article/domain/entitites/article.dart';

final articles = <Article>[
  Article(
      title: 'test1',
      content: 'test1',
      publishedAt: DateTime.now(),
      url: 'url1',
      urlToImage: 'urlToImage1'),
  Article(
      title: 'test2',
      content: 'test2',
      publishedAt: DateTime.now(),
      url: 'url2',
      urlToImage: 'urlToImage2')
];
