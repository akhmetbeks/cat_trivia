// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';

part 'fact_entity.g.dart';

@HiveType(typeId: 0)
class FactEntity extends HiveObject {
  FactEntity({required this.fact, required this.createdAt});

  @HiveField(0)
  String fact;

  @HiveField(1)
  DateTime createdAt;
}
