import 'package:nova_kudos_flutter/src/data/entity/purchase/purchase_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/purchase/purchase_model.dart';

extension PurchaseMapper on PurchaseEntity {
  get mapToModel {
    return PurchaseModel(
      trackingCode: trackingCode,
    );
  }
}
