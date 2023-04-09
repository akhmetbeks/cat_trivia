import '../../../domain/entities/fact_entity.dart';

abstract class RemoteDatasource {
  Future<FactEntity> getFacts();
  Future<dynamic> getImage();
}