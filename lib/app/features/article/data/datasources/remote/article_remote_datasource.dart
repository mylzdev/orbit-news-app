import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/environment/environment.dart';
import '../../../../../core/utils/logger/logger.dart';
import '../../api/api.dart';
import '../../models/article_model.dart';

class ArticleRemoteDatasource {
  final RestClient client;

  ArticleRemoteDatasource({required this.client});

  Future<Either<Failure, List<ArticleModel>>> getArticles(ArticleCategory category) async {
    try {
      final articles =
          await client.getTopHeadlines(Environment.apiKey, category);
      return Right(articles.articles ?? []);
    } on DioException catch (e) {
      TLoggerHelper.error(e.toString());
      return Left(Failure(e.message));
    } on Exception catch (_) {
      return const Left(Failure(serverErrorMessage));
    }
  }
}
