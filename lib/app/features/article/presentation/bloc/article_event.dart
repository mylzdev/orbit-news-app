import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/api/api.dart';

part 'article_event.freezed.dart';

@freezed
class ArticleEvent with _$ArticleEvent {
  const factory ArticleEvent.getData(ArticleCategory category) = GetData;
}
