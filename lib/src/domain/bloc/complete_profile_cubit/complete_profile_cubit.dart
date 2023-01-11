import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/mixins/value_changed_mixin.dart';

class CompleteProfileCubit extends FileCubit<CompleteProfileStates>
    with ValueChangeChecker<String> {
  LocalStorageRepository localStorageRepository;
  UserRepository userRepository;

  CompleteProfileCubit({
    required this.localStorageRepository,
    required this.userRepository,
  }) : super(CompleteProfileInitState()) {
    getUserCompanyModelFromPref();
  }

  UserCompanyModel? userCompanyModel;

  void getUserCompanyModelFromPref() async {
    emit(const CompleteProfileGetUserState.loading());
    userCompanyModel = await localStorageRepository.getUser();
    setInitValue(userCompanyModel?.phoneNumber);
    emit(const CompleteProfileGetUserState.success());
  }

  void onChangedPhoneNumber(String? phoneNumber) {
    if (phoneNumber != null &&
        phoneNumber.isNotEmpty &&
        isValueChanged(phoneNumber) &&
        phoneNumber.length == 11) {
      emit(const CompleteProfileFormValidationState.valid());
    } else {
      emit(const CompleteProfileFormValidationState.invalid());
    }
  }

  void updatePhoneNumberInLocal(String phoneNumber) {
    setInitValue(phoneNumber);
    localStorageRepository.updateUserCompanyModel(UserCompanyModel(
      phoneNumber: phoneNumber,
    ));
    emit(const CompleteProfileFormValidationState.invalid());
  }

  @override
  Future<void> upload(File file) async {
    emitUploading();
    await safeCall(
      apiCall: fileRepository.upload(
        url: "users/change-avatar",
        bodyParameters: FormData.fromMap({
          "avatar": await MultipartFile.fromFile(file.path,
              filename: parseFileName(file)),
        }),
        onSendProgress: onSendProgress,
      ),
      onSuccess: (result) async {
        await localStorageRepository.updateUserCompanyModel(UserCompanyModel(
          avatar: result?.data["avatar"],
        ));
        emitSuccessUploading();
      },
      onFailed: (failedStatus, error) {
        emitFailedUploading(error);
      },
    );
  }

  Future<void> postChangePhone(String phoneNumber) async {
    emit(const ChangePhoneProfileState.loading());
    await safeCall(
      apiCall: userRepository.postChangeMobile(mobile: phoneNumber),
      onSuccess: (result) {
        emit(const ChangePhoneProfileState.success());
      },
      onFailed: (failedStatus, error) {
        emit(ChangePhoneProfileState.failed(error));
      },
    );
  }
}
