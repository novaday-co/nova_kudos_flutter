import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  @JsonKey(name: "product_name")
  String? name;

  @JsonKey(name: "product_currency")
  int? currency;

  @JsonKey(name: "product_coin")
  int? coin;

  @JsonKey(name: "product_amount")
  int? amount;

  @JsonKey(name: "product_avatar")
  String? avatar;

  @JsonKey(name: "product_expiration_date")
  DateTime? expirationDate;

  ProductEntity({
    this.name,
    this.currency,
    this.coin,
    this.amount,
    this.avatar,
    this.expirationDate,
  });

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);
}
