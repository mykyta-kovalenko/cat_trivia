import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../resources/hive_constants.dart';

part 'fact.g.dart';

@HiveType(typeId: HiveConstants.factsId)
@JsonSerializable()
class Fact extends Equatable {
  @HiveField(0)
  final String fact;

  const Fact({required this.fact});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);

  @override
  List<Object?> get props => [fact];
}
