import '../repositories/repository.dart';
import 'usecase.dart';

class GetImageUsecase extends Usecase<dynamic, Type> {
  GetImageUsecase({required this.repository});
  
  final Repository repository;

  @override
  Future<dynamic> call(Type param) async {
    return await repository.getImage();
  }
}
