import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';

class SettingsCubit extends Cubit<SettingsState> {
  LocalStorageRepository localStorageRepository;
  AuthRepository authRepository;

  SettingsCubit({
    required this.authRepository,
    required this.localStorageRepository,
  }) : super(InitSettingsState());

  Future<void> logout() async {
    emit(const LogoutSettingsState.loading());
    await authRepository.logout();
    await localStorageRepository.clearLocalStorage();
    emit(const LogoutSettingsState.success());
  }
}
