
import 'package:bloc/bloc.dart';
import '../../domain/entities/fact_entity.dart';
import '../../domain/usecases/get_fact_usecase.dart';
import '../../domain/usecases/load_facts_usecase.dart';
import '../../domain/usecases/save_fact_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cat_fact_event.dart';
part 'cat_fact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final GetFactUsecase getFactUsecase;
  final SaveFactUsecase saveFactUsecase;
  final LoadFactsUsecase loadFactsUsecase;

  CatFactBloc({
    required this.loadFactsUsecase,
    required this.saveFactUsecase,
    required this.getFactUsecase,
  }) : super(CatFactInitial()) {
    on<NewCatFactEvent>((event, emit) async {
      emit(CatFactLoading());
      try {
        final fact = await getFactUsecase(Type);
        await saveFactUsecase(fact);
        emit(CatFactLoaded(fact: fact));
      } catch (e) {
        emit(const CatFactError(error: ''));
      }
    });

    on<LoadHistoryEvent>((event, emit) async {
      emit(CatFactLoading());
      try {
        final facts = await loadFactsUsecase(Type);
        emit(CatFactsHistoryLoaded(facts: facts));
      } catch (e) {
        emit(const CatFactError(error: ''));
      }
    });
  }
}
