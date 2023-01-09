import 'package:json_annotation/json_annotation.dart';

part 'coin_system_entity.g.dart';

@JsonSerializable()
class CoinSystemEntity {
  @JsonKey(name: "coin_value")
  int? coinValue;

  @JsonKey(name: "system_value")
  int? systemValue;

  CoinSystemEntity({
    this.coinValue,
    this.systemValue,
  });

  Map<String, dynamic> toJson() => _$CoinSystemEntityToJson(this);

  factory CoinSystemEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinSystemEntityFromJson(json);
}
