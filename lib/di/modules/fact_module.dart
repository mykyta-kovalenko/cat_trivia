import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../api/fact_client.dart';

@module
abstract class FactModule {
  @lazySingleton
  Dio dio() {
    return Dio()
      ..options.sendTimeout = 10000
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  }

  @lazySingleton
  FactClient factClient(Dio dio) => FactClient(dio);
}
