import 'package:cat_trivia/ui/pages/home_page/view/facts_list_view.dart';
import 'package:cat_trivia/ui/pages/home_page/view/random_facts_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cat Trivia',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: PageView(
          children: const [
            RandomFactsView(),
            FactsListView(),
          ],
        ));
  }
}
