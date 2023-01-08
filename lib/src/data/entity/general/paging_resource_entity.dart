import 'package:nova_kudos_flutter/src/data/entity/general/links_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/general/meta_entity.dart';


class PaginationResourceEntity<T> {
  List<T> data = [];
  LinksEntity? links;
  MetaEntity? meta;

  PaginationResourceEntity({
    this.data = const [],
    this.links,
    this.meta,
  });

  PaginationResourceEntity.fromJson(
      dynamic json, T Function(dynamic) dataFromJson) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(dataFromJson(v));
      });
    }
    links = json['links'] != null ? LinksEntity.fromJson(json['links']) : null;
    meta = json['meta'] != null ? MetaEntity.fromJson(json['meta']) : null;
  }


  Map<String, dynamic> toJson(
      Map<String, dynamic> Function(dynamic) dataToJson) {
    final map = <String, dynamic>{};
    map['data'] = data.map((v) => dataToJson(v)).toList();
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}
