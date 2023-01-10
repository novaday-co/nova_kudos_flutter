import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashCubit extends BaseCubit<SplashState> {
  LocalStorageRepository localStorageRepository;
  UserRepository userRepository;

  SplashCubit(
      {required this.localStorageRepository, required this.userRepository})
      : super(SplashInitState());

  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  void checkUserToken() async {
    final token = await localStorageRepository.getToken();
    await Future.delayed(const Duration(seconds: 2));
    if (token != null) {
      await safeCall(
        apiCall: userRepository.getProfile(),
      );
      emit(const CheckUserSplashState.authenticated());
    } else {
      emit(const CheckUserSplashState.unAuthenticated());
    }
  }
}
