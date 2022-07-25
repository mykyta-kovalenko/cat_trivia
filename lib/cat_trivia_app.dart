import 'package:flutter/material.dart';

import './ui/pages/home_page/home_page.dart';
import 'resources/color_constants.dart';

class CatTriviaApp extends StatelessWidget {
  const CatTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(AppColors.orange),
            foregroundColor: MaterialStateProperty.all(AppColors.black),
            backgroundColor: MaterialStateProperty.all(AppColors.white),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.orange, width: 2),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
