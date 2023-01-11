import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/product/product_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/purchase/purchase_model.dart';

part 'shop_state.freezed.dart';

abstract class ShopState extends BasePaginationState<ProductModel> {}

class InitShopState extends ShopState {}

@freezed
class PurchaseRequestState extends ShopState with _$PurchaseRequestState {
  const factory PurchaseRequestState.loading() = LoadingPurchaseRequestState;

  const factory PurchaseRequestState.success(PurchaseModel purchaseModel) =
      SuccessPurchaseRequestState;

  const factory PurchaseRequestState.failed(String? error) =
      FailedPurchaseRequestState;
}

@freezed
class GetUserState extends ShopState with _$GetUserState {
  const factory GetUserState.loading() = LoadingGetUserState;

  const factory GetUserState.success() =
  SuccessGetUserState;


}
