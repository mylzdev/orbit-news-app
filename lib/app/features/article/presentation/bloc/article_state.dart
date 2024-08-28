import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/app/core/errors/failure.dart';
import 'package:news_app/app/features/article/domain/entitites/article.dart';

part 'article_state.freezed.dart';

@freezed
sealed class ArticleState with _$ArticleState {
  const factory ArticleState.initial() = ArticleInitial;  
  const factory ArticleState.loading() = ArticleLoading;  
  const factory ArticleState.success(List<Article> articles) = ArticleSuccess;  
  const factory ArticleState.error(Failure failure) = ArticleError;  
}