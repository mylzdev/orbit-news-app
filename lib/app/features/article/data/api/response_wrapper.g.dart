// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWrapper _$ResponseWrapperFromJson(Map<String, dynamic> json) =>
    ResponseWrapper(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseWrapperToJson(ResponseWrapper instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
