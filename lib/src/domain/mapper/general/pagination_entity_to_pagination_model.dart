import 'package:nova_kudos_flutter/src/data/entity/general/meta_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/general/paging_resource_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';

extension PaginationMapper on PaginationResourceEntity {
  PaginationResourceModel<T> mapTo<D, T>({required T Function(D data) mapper}) {
    return PaginationResourceModel<T>(
      data: data.map((e) => mapper(e)).toList(),
      meta: meta!.mapTo(),
    );
  }
}

extension MetaMapper on MetaEntity {
  MetaModel mapTo() {
    return MetaModel(
      lastPage: lastPage,
      currentPage: currentPage,
    );
  }
}
