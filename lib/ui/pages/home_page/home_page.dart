import 'package:flutter/material.dart';

import './view/facts_list_view.dart';
import './view/random_fact_view.dart';
import '../../../resources/app_constants.dart';
import '../../../resources/color_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.pets, color: AppColors.orange),
            SizedBox(width: 8),
            Text(
              AppConstants.catTrivia,
              style: TextStyle(color: AppColors.black),
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
