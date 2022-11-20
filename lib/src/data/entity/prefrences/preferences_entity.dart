import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferences_entity.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class PreferencesEntity {
  @JsonKey(name: 'locale')
  @HiveField(0)
  String? locale;
  @HiveField(1)
  @JsonKey(name: 'language')
  String? language;
  @HiveField(2, defaultValue: 'Solar')
  @JsonKey(name: 'theme')
  @HiveField(4)
  String? theme;

  PreferencesEntity({
    this.language,
    this.locale,
    this.theme,
  });

  factory PreferencesEntity.fromJson(Map<String, dynamic> json) =>
      _$PreferencesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesEntityToJson(this);
}
