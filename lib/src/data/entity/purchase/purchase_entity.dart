import 'package:json_annotation/json_annotation.dart';

part 'purchase_entity.g.dart';

@JsonSerializable()
class PurchaseEntity {
  @JsonKey(name: "tracking_code")
  String? trackingCode;

  @JsonKey(name: "coin_amount")
  int? coinAmount;

  PurchaseEntity({
    this.trackingCode,
    this.coinAmount,
  });

  Map<String, dynamic> toJson() => _$PurchaseEntityToJson(this);

  factory PurchaseEntity.fromJson(Map<String, dynamic> json) =>
      _$PurchaseEntityFromJson(json);
}
