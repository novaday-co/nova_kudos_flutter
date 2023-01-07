import 'package:json_annotation/json_annotation.dart';

part 'links_entity.g.dart';

@JsonSerializable()
class LinksEntity {
  @JsonKey(name: "first")
  String? first;
  @JsonKey(name: "last")
  String? last;
  @JsonKey(name: "prev")
  dynamic prev;
  @JsonKey(name: "next")
  String? next;

  LinksEntity({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory LinksEntity.fromJson(Map<String,dynamic> json) => _$LinksEntityFromJson(json);

  Map<String,dynamic> toJson() => _$LinksEntityToJson(this);

}
