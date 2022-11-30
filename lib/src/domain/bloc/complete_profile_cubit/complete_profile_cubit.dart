import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitState());

  void profileForm(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const CompleteProfileFormValidationState.valid());
    } else {
      emit(const CompleteProfileFormValidationState.invalid());
    }
  }

  void selectProfilePicture(BuildContext context) async {
    final imagePath = await showAccessMediaPickerSheet(context);
    if(imagePath != null){
      emit(CompleteProfilePictureState.selected(imagePath));
    }
  }
}
