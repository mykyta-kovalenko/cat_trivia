import 'package:cat_trivia/data/model/fact.dart';
import 'package:cat_trivia/di/di.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cat_trivia_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FactAdapter());
  await configureDependencies();
  runApp(const CatTriviaApp());
}
