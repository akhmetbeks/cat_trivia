import '../entities/fact_entity.dart';
import '../repositories/repository.dart';
import 'usecase.dart';

class GetFactUsecase extends Usecase<FactEntity, Type> {
  GetFactUsecase({required this.repository});

  final Repository repository;

  @override
  Future<FactEntity> call(Type param) async {
    final fact = await repository.getFacts();
    return fact;
  }
}
