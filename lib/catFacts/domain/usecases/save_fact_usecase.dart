import '../entities/fact_entity.dart';
import '../repositories/repository.dart';
import 'usecase.dart';

class SaveFactUsecase extends Usecase<void, FactEntity> {
  SaveFactUsecase({required this.repository});
  
  final Repository repository;

  @override
  Future<void> call(FactEntity param) async {
    await repository.saveFact(param);
  }
}
