import '../../../domain/entities/fact_entity.dart';
import 'remote_datasource.dart';
import 'rest_service.dart';

class RemoteDatasourceImpl extends RemoteDatasource {
  RemoteDatasourceImpl({required this.restService});

  final RestService restService;

  @override
  Future<FactEntity> getFacts() async {
    try {
      final fact = await restService.getFact();
      return fact;
    } on Exception catch (_) {
      throw Exception();
    }
  }

  @override
  Future<dynamic> getImage() async {
    try {
      final response = await restService.getImage();
      return response.response.data;
    } on Exception catch (_) {
      throw Exception();
    }
  }
}
