import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';

part 'shop_state.freezed.dart';

abstract class ShopState {}

class InitShopState extends ShopState {}

@freezed
class GetShopRequestState extends ShopState with _$GetShopRequestState {
  const factory GetShopRequestState.loading() = LoadingGetShopRequestState;

  const factory GetShopRequestState.success(List<ShopModel> shopItems) =
      SuccessGetShopRequestState;

  const factory GetShopRequestState.failed(String? error) =
      FailedGetShopRequestState;
}
