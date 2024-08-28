import 'package:json_annotation/json_annotation.dart';

import '../../domain/entitites/article.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Article {
  const ArticleModel({
    required super.title,
    required super.content,
    required super.publishedAt,
    required super.url,
    required super.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
