part of 'facts_list_view_cubit.dart';

enum FactsListViewStatus {
  initial,
  loading,
  success,
  failure,
}

@immutable
class FactsListViewState extends Equatable {
  final FactsListViewStatus status;
  final List<Fact> facts;
  final String? error;

  const FactsListViewState({
    this.status = FactsListViewStatus.initial,
    this.facts = const [],
    this.error,
  });

  FactsListViewState copyWith({
    FactsListViewStatus? status,
    List<Fact>? facts,
    String? error,
  }) {
    return FactsListViewState(
      status: status ?? this.status,
      facts: facts ?? this.facts,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, facts, error];
}
