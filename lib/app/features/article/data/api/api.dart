import 'package:dio/dio.dart';
import 'package:news_app/app/features/article/data/api/response_wrapper.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/everything?q={category}&apiKey={apikey}")
  Future<ResponseWrapper> getTopHeadlines(@Path('apikey') String apikey,
      @Path('category') ArticleCategory category);
}

enum ArticleCategory {
  general,
  health,
  business,
  entertainment,
  science,
  sports,
  technology,
}
