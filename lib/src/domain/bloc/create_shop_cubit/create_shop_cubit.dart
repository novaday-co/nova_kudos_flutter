import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';

class CreateShopCubit extends Cubit<CreateShopState> {
  CreateShopCubit() : super(InitCreateShopState());

  void selectProfilePicture(BuildContext context) async {
    final imagePath = await showAccessMediaPickerSheet(context);
    if (imagePath != null) {
      emit(CreateShopPictureState.selected(imagePath));
    }
  }
}
