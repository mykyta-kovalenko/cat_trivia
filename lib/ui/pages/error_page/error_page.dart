import 'package:flutter/material.dart';

import '../../../resources/app_constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text(AppConstants.error)));
  }
}
