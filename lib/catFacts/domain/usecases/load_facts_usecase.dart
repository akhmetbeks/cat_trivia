import '../repositories/repository.dart';
import 'usecase.dart';

class LoadFactsUsecase extends Usecase<List<dynamic>, Type> {
  final Repository repository;

  LoadFactsUsecase({required this.repository});
  @override
  Future<List<dynamic>> call(Type param) async {
    return repository.loadFacts();
  }
}
