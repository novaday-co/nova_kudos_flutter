import 'package:nova_kudos_flutter/src/data/entity/company/product/product_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';

extension ProductMapper on ProductEntity {
  get mapTo {
    return ProductModel(
        id: id,
        avatar: avatar,
        name: name,
        amount: amount,
        coin: coin,
        currency: currency,
        expirationDate: expirationDate);
  }
}
