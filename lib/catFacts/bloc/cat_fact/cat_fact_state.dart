part of 'cat_fact_bloc.dart';

abstract class CatFactState extends Equatable {
  const CatFactState();

  @override
  List<Object> get props => [];
}

class CatFactInitial extends CatFactState {}

class CatFactLoading extends CatFactState {}

class CatFactLoaded extends CatFactState {
  final FactEntity fact;

  const CatFactLoaded({required this.fact});

  @override
  List<Object> get props => [fact.fact];
}

class CatFactsHistoryLoaded extends CatFactState {
  final List<dynamic> facts;

  const CatFactsHistoryLoaded({required this.facts});
}

class CatFactError extends CatFactState {
  final String error;

  const CatFactError({required this.error});
}
