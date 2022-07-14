import 'package:flutter/material.dart';

import 'ui/pages/home_page/home_page.dart';

class CatTriviaApp extends StatelessWidget {
  const CatTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
