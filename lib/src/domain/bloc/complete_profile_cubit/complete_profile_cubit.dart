import 'package:flutter/cupertino.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';

class CompleteProfileCubit extends FileCubit {
  LocalStorageRepository localStorageRepository;

  CompleteProfileCubit({
    required this.localStorageRepository,
  }) : super(CompleteProfileInitState()){
   getUserCompanyModelFromPref();
  }

  UserCompanyModel? userCompanyModel;

  void getUserCompanyModelFromPref() async {
    emit(const CompleteProfileGetUserState.loading());
    userCompanyModel = await localStorageRepository.getUser();
    print(userCompanyModel?.avatar);
    userCompanyModel?.phoneNumber = "0902432424";
    emit(const CompleteProfileGetUserState.success());
  }

  void profileForm(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const CompleteProfileFormValidationState.valid());
    } else {
      emit(const CompleteProfileFormValidationState.invalid());
    }
  }

  void selectProfilePicture(BuildContext context) async {
    final imagePath = await showAccessMediaPickerSheet(context);
    if (imagePath != null) {
      emit(CompleteProfilePictureState.selected(imagePath));
    }
  }
}
