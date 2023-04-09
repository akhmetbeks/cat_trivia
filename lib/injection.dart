import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'catFacts/bloc/cat_fact/cat_fact_bloc.dart';
import 'catFacts/bloc/cat_image/cat_image_bloc.dart';
import 'catFacts/data/datasources/local_datasources/local_datasource.dart';
import 'catFacts/data/datasources/local_datasources/local_datasource_impl.dart';
import 'catFacts/data/datasources/remote_datasources/remote_datasource.dart';
import 'catFacts/data/datasources/remote_datasources/remote_datasource_impl.dart';
import 'catFacts/data/datasources/remote_datasources/rest_service.dart';
import 'catFacts/data/repositories/repository_impl.dart';
import 'catFacts/domain/entities/fact_entity.dart';
import 'catFacts/domain/repositories/repository.dart';
import 'catFacts/domain/usecases/get_fact_usecase.dart';
import 'catFacts/domain/usecases/get_image_usecase.dart';
import 'catFacts/domain/usecases/load_facts_usecase.dart';
import 'catFacts/domain/usecases/save_fact_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CatFactBloc(
      getFactUsecase: sl(), saveFactUsecase: sl(), loadFactsUsecase: sl())
    ..add(NewCatFactEvent()));

  sl.registerFactory(
      () => CatImageBloc(getImageUsecase: sl())..add(LoadCatImageEvent()));

  sl.registerLazySingleton(() => GetFactUsecase(repository: sl()));

  sl.registerLazySingleton(() => GetImageUsecase(repository: sl()));

  sl.registerLazySingleton(() => SaveFactUsecase(repository: sl()));

  sl.registerLazySingleton(() => LoadFactsUsecase(repository: sl()));

  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDatasource: sl(), localDatasource: sl()));

  sl.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(restService: sl()));

  sl.registerLazySingleton<LocalDatasource>(() => LocalDatasourceImpl());

  sl.registerLazySingleton(() => RestService(sl()));

  sl.registerLazySingleton(() => Dio());

  await Hive.initFlutter();
  Hive.registerAdapter(FactEntityAdapter());
  await Hive.openBox('new');
  sl.registerSingleton<HiveInterface>(Hive);
}
