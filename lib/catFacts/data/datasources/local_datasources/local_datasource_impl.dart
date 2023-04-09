import 'package:hive_flutter/hive_flutter.dart';

import '../../../../injection.dart';
import '../../../domain/entities/fact_entity.dart';
import 'local_datasource.dart';

class LocalDatasourceImpl extends LocalDatasource {
  @override
  Future<void> saveFact(FactEntity fact) async {
    final factsBox = sl<HiveInterface>().box('new');
    await factsBox.add(fact);
  }

  @override
  Future<List<dynamic>> loadFacts() async {
    final factsBox = sl<HiveInterface>().box('new');
    final facts = factsBox.toMap().values.toList();

    return facts;
  }
}
