part of 'random_fact_view_cubit.dart';

enum RandomFactViewStatus {
  initial,
  loading,
  success,
  failure,
}

@immutable
class RandomFactViewState extends Equatable {
  final RandomFactViewStatus status;
  final Fact fact;
  final String image;
  final String error;

  const RandomFactViewState({
    this.status = RandomFactViewStatus.initial,
    this.fact = const Fact(fact: ''),
    this.image = '',
    this.error = '',
  });

  RandomFactViewState copyWith({
    RandomFactViewStatus? status,
    Fact? fact,
    String? image,
    String? error,
  }) {
    return RandomFactViewState(
      status: status ?? this.status,
      fact: fact ?? this.fact,
      image: image ?? this.image,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, fact, image, error];
}
