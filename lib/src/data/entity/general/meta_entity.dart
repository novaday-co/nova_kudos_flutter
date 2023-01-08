import 'package:json_annotation/json_annotation.dart';

part 'meta_entity.g.dart';

@JsonSerializable()
class MetaEntity {
  @JsonKey(name: "current_page",defaultValue: 0)
  int currentPage = 0;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page",defaultValue: 0)
  int lastPage = 0;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  MetaEntity({
    this.currentPage = 0,
    this.from,
    this.lastPage = 0,
    this.path,
    this.to,
    this.total,
  });

  factory MetaEntity.fromJson(Map<String,dynamic> json) => _$MetaEntityFromJson(json);

  Map<String,dynamic> toJson() => _$MetaEntityToJson(this);

}
