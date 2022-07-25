import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/fact.dart';
import '../../services/fact_service.dart';
import '../../storages/facts_storage.dart';
import '../core/base_cubit.dart';

part 'random_fact_view_state.dart';

@injectable
class RandomFactViewCubit extends BaseCubit<RandomFactViewState> {
  final FactsStorage factsStorage;
  final FactService factService;

  RandomFactViewCubit({
    required this.factsStorage,
    required this.factService,
  }) : super(const RandomFactViewState());

  Future<void> getFact() async {
    emit(state.copyWith(status: RandomFactViewStatus.loading));

    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: RandomFactViewStatus.success,
        fact: await factService.getFact(),
        image: await factService.getImage(),
      ));
    });
  }

  Future<void> setFact(Fact fact) async {
    getFact();

    await makeErrorHandledCall(() async {
      factsStorage.setFact(fact);
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: RandomFactViewStatus.failure,
      error: errorMessage,
    ));
  }
}
