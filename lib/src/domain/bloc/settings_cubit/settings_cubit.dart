import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(InitSettingsState());

  Future<void> logout(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.splash, (route) => false);
    });
  }
}
