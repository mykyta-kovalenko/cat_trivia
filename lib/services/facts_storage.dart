import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../data/model/fact.dart';

@injectable
@preResolve
class FactsStorage {
  @factoryMethod
  static Future<FactsStorage> create() async {
    final box = await Hive.openBox<Fact>('factsBox');
    return FactsStorage._(box);
  }

  final Box<Fact> _box;

  FactsStorage._(this._box);

  void dispose() {
    _box.close();
  }

  Future<List<Fact>> getFacts() async {
    return _box.values.toList().reversed.toList();
  }

  Future<void> setFact(Fact fact) async => await _box.add(fact);
}
