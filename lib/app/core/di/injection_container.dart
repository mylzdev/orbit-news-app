import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/app/features/article/data/datasources/local/hive/article_local_datasource_hive.dart';

import '../../features/article/data/api/api.dart';
import '../../features/article/data/datasources/local/article_local_datasource.dart';
import '../../features/article/data/datasources/remote/article_remote_datasource.dart';
import '../../features/article/data/repositories/article_repositories_impl.dart';
import '../../features/article/domain/repositories/article_repositories.dart';
import '../../features/article/domain/usecases/get_local_articles_usecase.dart';
import '../../features/article/domain/usecases/get_remote_articles_usecase.dart';
import '../../features/article/presentation/bloc/article_bloc.dart';
import '../network/network_info.dart';

final GetIt sl = GetIt.instance;

void init() {
  // Core
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(
    () => RestClient(Dio(BaseOptions(contentType: "application/json"))),
  );

  // Data Sources
  sl.registerFactory<ArticleRemoteDatasource>(
    () => ArticleRemoteDatasource(client: sl()),
  );
  sl.registerFactory<ArticleLocalDatasource>(
      () => ArticlesLocalDatasourceHiveImpl());

  // Repositories
  sl.registerLazySingleton<ArticleRepositories>(
    () => ArticleRepositoriesImpl(
      localDatasource: sl(),
      remoteDatasource: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetRemoteArticlesUsecase(sl()));
  sl.registerLazySingleton(() => GetLocalArticlesUsecase(sl()));

  // Features
  sl.registerFactory(
    () => ArticleBloc(
      network: sl(),
      remoteUsecase: sl(),
      localUsecase: sl(),
    ),
  );
}
