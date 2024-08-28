import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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

  ArticleBloc({
    required this.network,
    required this.remoteUsecase,
    required this.localUsecase,
  }) : super(const ArticleInitial()) {
    on<GetData>(_onGetData);
  }

  Future<void> _onGetData(GetData event, Emitter<ArticleState> emit) async {
    emit(const ArticleLoading());
    final isConnected = await network.isConnected;

    if (isConnected) {
      final failureOrRemoteArticles = await remoteUsecase(NoParams());
      _eitherFailureOrArticles(failureOrRemoteArticles, emit);
    } else {
      final failureOrLocalArticles = await localUsecase(NoParams());
      _eitherFailureOrArticles(failureOrLocalArticles, emit);
      waitForConnectivityAndNotifyGetDataEvent();
    }
  }

  void _eitherFailureOrArticles(
      _EitherFailureOrArticles failureOrArticles, Emitter<ArticleState> emit) {
    failureOrArticles.fold(
      (failure) => emit(ArticleError(Failure(failure.message))),
      (articles) => emit(ArticleSuccess(articles)),
    );
  }

  void waitForConnectivityAndNotifyGetDataEvent() {
    StreamSubscription? subscription;
    subscription = network.internetConnectionStatus.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        subscription?.cancel();
        add(const GetData());
      } else {
        Get.defaultDialog(
          title: 'No Internet',
          middleText: 'Please Connect to the Internet to continue reading',
        );
      }
    });
  }
}
