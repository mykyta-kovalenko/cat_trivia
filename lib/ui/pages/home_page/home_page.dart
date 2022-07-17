import 'package:flutter/material.dart';

import './view/facts_list_view.dart';
import './view/random_fact_view.dart';
import '../../../resources/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.pets, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              AppConstants.catTrivia,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: PageView(
        children: [RandomFactView.create(), FactsListView.create()],
      ),
    );
  }
}
