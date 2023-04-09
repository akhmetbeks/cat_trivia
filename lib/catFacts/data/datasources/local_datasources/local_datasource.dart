import '../../../domain/entities/fact_entity.dart';

abstract class LocalDatasource{
  Future<void> saveFact(FactEntity fact);
  Future<List<dynamic>> loadFacts();
}