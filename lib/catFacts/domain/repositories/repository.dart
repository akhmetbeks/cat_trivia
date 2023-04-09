import '../entities/fact_entity.dart';

abstract class Repository{
  Future<FactEntity> getFacts();
  Future<dynamic> getImage();
  Future<void> saveFact(FactEntity fact);
  Future<List<dynamic>> loadFacts();
}