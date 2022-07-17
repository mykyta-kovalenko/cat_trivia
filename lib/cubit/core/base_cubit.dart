import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(String errorMessage);

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } catch (exception) {
      log(exception.toString());
      handleError(exception.toString());
    }
  }
}
