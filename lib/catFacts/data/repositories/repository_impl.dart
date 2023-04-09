import '../datasources/local_datasources/local_datasource.dart';
import '../datasources/remote_datasources/remote_datasource.dart';
import '../../domain/entities/fact_entity.dart';
import '../../domain/repositories/repository.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  @override
  Future<FactEntity> getFacts() async {
    return await remoteDatasource.getFacts();
  }

  @override
  Future<dynamic> getImage() async {
    final image = await remoteDatasource.getImage();
    return image;
  }

  @override
  Future<void> saveFact(FactEntity fact) async {
    await localDatasource.saveFact(fact);
  }
  
  @override
  Future<List<dynamic>> loadFacts() async{
    return await localDatasource.loadFacts();
  }
}
