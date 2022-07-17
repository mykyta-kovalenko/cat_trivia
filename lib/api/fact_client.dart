import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../data/model/fact.dart';
import 'api_constants.dart';

part 'fact_client.g.dart';

@RestApi(baseUrl: ApiConstants.factBaseUrl)
abstract class FactClient {
  factory FactClient(Dio dio, {String baseUrl}) = _FactClient;

  @GET("/fact")
  Future<Fact> getFact();
}
