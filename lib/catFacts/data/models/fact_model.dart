import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/fact_entity.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class FactModel extends FactEntity {
  FactModel._({required String fact, required DateTime createdAt})
      : super(fact: fact, createdAt: createdAt);

  factory FactModel({required String fact}) {
    final now = DateTime.now();
    return FactModel._(fact: fact, createdAt: now);
  }

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
