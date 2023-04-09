part of 'cat_fact_bloc.dart';

abstract class CatFactEvent extends Equatable {
  const CatFactEvent();

  @override
  List<Object> get props => [];
}

class NewCatFactEvent extends CatFactEvent {}

class LoadHistoryEvent extends CatFactEvent {}
