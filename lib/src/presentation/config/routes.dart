abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const verifyCode = _Paths.verifyCode;
  static const completeProfile = _Paths.completeProfile;
}

abstract class _Paths {
  static const splash = '/';
  static const login = '/login';
  static const verifyCode = '/verify-code';
  static const completeProfile = '/complete_profile';
}