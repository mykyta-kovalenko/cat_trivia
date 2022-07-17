import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/fact.dart';
import '../../services/facts_storage.dart';
import '../core/base_cubit.dart';

part 'facts_list_view_state.dart';

@injectable
class FactsListViewCubit extends BaseCubit<FactsListViewState> {
  final FactsStorage factsStorage;

  FactsListViewCubit({
    required this.factsStorage,
  }) : super(const FactsListViewState());

  Future<void> getFacts() async {
    emit(state.copyWith(status: FactsListViewStatus.loading));

    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: FactsListViewStatus.success,
        facts: await factsStorage.getFacts(),
      ));
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: FactsListViewStatus.failure,
      error: errorMessage,
    ));
  }
}
