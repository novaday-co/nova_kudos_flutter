import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashCubit extends Cubit<SplashState> {
  LocalStorageRepository localStorageRepository;

  SplashCubit({
    required this.localStorageRepository,
  }) : super(SplashInitState());

  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  void checkUserToken() async {
    final token = await localStorageRepository.getToken();
    await Future.delayed(const Duration(seconds: 2));
    if(token != null){
      emit(const CheckUserSplashState.authenticated());
    }
    else{
      emit(const CheckUserSplashState.unAuthenticated());
    }
  }
}
