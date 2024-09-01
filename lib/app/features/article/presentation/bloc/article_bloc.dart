import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/app/features/article/data/api/api.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entitites/article.dart';
import '../../domain/usecases/get_local_articles_usecase.dart';
import '../../domain/usecases/get_remote_articles_usecase.dart';
import 'article_event.dart';
import 'article_state.dart';

typedef _EitherFailureOrArticles = Either<Failure, List<Article>>;

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NetworkInfo network;
  final GetRemoteArticlesUsecase remoteUsecase;
  final GetLocalArticlesUsecase localUsecase;

  final Map<ArticleCategory, List<Article>> cachedArticles = {};

  ArticleBloc({
    required this.network,
    required this.remoteUsecase,
    required this.localUsecase,
  }) : super(const ArticleInitial()) {
    on<GetData>(_onGetData);
  }

  Future<void> _onGetData(GetData event, Emitter<ArticleState> emit) async {
    if (cachedArticles.containsKey(event.category)) {
      emit(ArticleSuccess(cachedArticles[event.category]!));
      return;
    }

    emit(const ArticleLoading());
    final isConnected = await network.isConnected;

    if (isConnected) {
      final failureOrRemoteArticles =
          await remoteUsecase(Params(event.category));
      _eitherFailureOrArticles(failureOrRemoteArticles, emit, event);
    } else {
      final failureOrLocalArticles = await localUsecase(NoParams());
      _eitherFailureOrArticles(failureOrLocalArticles, emit, event);
      waitForConnectivityAndNotifyGetDataEvent();
    }
  }

  void _eitherFailureOrArticles(_EitherFailureOrArticles failureOrArticles,
      Emitter<ArticleState> emit, GetData event) {
    failureOrArticles.fold(
      (failure) => emit(ArticleError(Failure(failure.message))),
      (articles) {
        cachedArticles[event.category] = articles;
        emit(ArticleSuccess(articles));
      },
    );
  }

  void waitForConnectivityAndNotifyGetDataEvent() {
    StreamSubscription? subscription;
    subscription = network.internetConnectionStatus.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        subscription?.cancel();
        add(const GetData(ArticleCategory.general));
      } else {
        Get.defaultDialog(
          title: 'No Internet',
          middleText: 'Please Connect to the Internet to continue reading',
        );
      }
    });
  }
}
