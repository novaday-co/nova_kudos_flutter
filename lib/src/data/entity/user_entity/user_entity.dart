import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0, adapterName: "UserEntityAdapter")
@JsonSerializable()
class UserEntity {
  @HiveField(0)
  @JsonKey(name: "mobile")
  String? mobileNumber;

  @HiveField(1)
  @JsonKey(name: "token")
  String? token;

  UserEntity({
    this.mobileNumber,
    this.token,
  });

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
