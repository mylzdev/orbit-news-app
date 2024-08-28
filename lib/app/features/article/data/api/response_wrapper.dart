import 'package:json_annotation/json_annotation.dart';

import '../models/article_model.dart';

part 'response_wrapper.g.dart';

@JsonSerializable()
class ResponseWrapper {
  @JsonKey(name: 'articles')
  final List<ArticleModel>? articles;

  ResponseWrapper({this.articles});

  factory ResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ResponseWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseWrapperToJson(this);
}
