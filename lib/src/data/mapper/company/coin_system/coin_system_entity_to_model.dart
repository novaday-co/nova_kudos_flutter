import 'package:nova_kudos_flutter/src/data/entity/company/coin_system_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/coin_system_model.dart';

extension CoinSystemMapper on CoinSystemEntity {
  get mapToModel {
    return CompanyCoinSystemModel(
      coinValue: coinValue,
      systemValue: systemValue,
    );
  }
}
