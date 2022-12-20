import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

abstract class SplashState{}

class SplashInitState extends SplashState{}

@freezed
class CheckUserSplashState extends SplashState with _$CheckUserSplashState {
  const factory CheckUserSplashState.unAuthenticated() = UnAuthenticatedUserSplashState;

  const factory CheckUserSplashState.authenticated() =
  AuthenticatedUserSplashState;

}
