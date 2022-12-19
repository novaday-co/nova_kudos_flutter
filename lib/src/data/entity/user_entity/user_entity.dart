import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name: "mobile")
  String? mobileNumber;
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
