import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_shop_state.freezed.dart';

abstract class CreateShopState {}

class InitCreateShopState extends CreateShopState {}

@freezed
class CreateShopPictureState extends CreateShopState
    with _$CreateShopPictureState {
  const factory CreateShopPictureState.selected(String imagePath) =
      SelectCreateShopPictureState;
}
