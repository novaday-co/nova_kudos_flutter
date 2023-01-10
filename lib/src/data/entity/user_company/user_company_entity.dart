import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_company_entity.g.dart';

@HiveType(typeId: 1, adapterName: "UserCompanyEntityAdapter")
@JsonSerializable()
class UserCompanyEntity {
  @HiveField(0)
  @JsonKey(name: "company_id")
  int? companyId;

  @HiveField(1)
  @JsonKey(name: "company_name")
  String? companyName;

  @HiveField(2)
  @JsonKey(name: "company_avatar")
  String? companyAvatar;

  @HiveField(3)
  @JsonKey(name: "first_name")
  String? userName;

  @HiveField(5)
  @JsonKey(name: "last_name")
  String? userLastName;

  @HiveField(6)
  @JsonKey(name: "job_position")
  String? jobPosition;

  @HiveField(7)
  @JsonKey(name: "avatar")
  String? avatar;

  @HiveField(8)
  @JsonKey(name: "coin_amount")
  int? coinAmount;

  @HiveField(9)
  @JsonKey(name: "currency_amount")
  int? currencyAmount;

  @HiveField(10)
  @JsonKey(name: "phone")
  String? phoneNumber;

  UserCompanyEntity({
    this.companyId,
    this.companyName,
    this.companyAvatar,
    this.userName,
    this.userLastName,
    this.jobPosition,
    this.avatar,
    this.coinAmount,
    this.currencyAmount,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$UserCompanyEntityToJson(this);

  factory UserCompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyEntityFromJson(json);
}
