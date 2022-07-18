import 'dart:math';

import 'package:injectable/injectable.dart';

import '../api/fact_client.dart';
import '../data/model/fact.dart';
import '../resources/app_constants.dart';

@injectable
class FactService {
  final FactClient _factsClient;

  FactService(this._factsClient);

  Future<Fact> getFact() async => await _factsClient.getFact();

  Future<String> getImage() async {
    return '${AppConstants.catImage}?v=${Random().nextInt(100)}';
  }
}
