import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';

part 'create_shop_state.freezed.dart';

abstract class CreateShopState extends BaseFileState {}

class InitCreateShopState extends CreateShopState {}

@freezed
class CreateProductFormValidationState extends CreateShopState {
  const factory CreateProductFormValidationState.valid() =
      CreateProductValidFormState;

  const factory CreateProductFormValidationState.invalid() =
      CreateProductInValidFormState;
}

@freezed
class CreateProductState extends CreateShopState with _$CreateProductState{
  const factory CreateProductState.loading() = LoadingCreateProductState;

  const factory CreateProductState.success() = SuccessCreateProductState;

  const factory CreateProductState.failed(String? error) =
      FailedCreateProductState;
}
