import 'package:hive/hive.dart';

part 'hive_article.g.dart';

@HiveType(typeId: 0, adapterName: 'HiveArticleAdapter')
class HiveArticle {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? content;

  @HiveField(2)
  final String? publishedAt;

  @HiveField(3)
  final String? url;

  @HiveField(4)
  final String? urlToImage;

  HiveArticle({
    this.title,
    this.content,
    this.publishedAt,
    this.url,
    this.urlToImage,
  });
}
