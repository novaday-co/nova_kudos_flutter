import 'package:json_annotation/json_annotation.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_entity.dart';

part 'user_company_collection.g.dart';

@JsonSerializable()
class UserCompanyCollection {
  @JsonKey(name: "default_company")
  UserCompanyEntity? defaultUserCompany;

  UserCompanyCollection({
    this.defaultUserCompany,
  });

  factory UserCompanyCollection.fromJson(dynamic json) =>
      _$UserCompanyCollectionFromJson(json);
}
