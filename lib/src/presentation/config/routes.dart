abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const verifyCode = _Paths.verifyCode;
}

abstract class _Paths {
  static const splash = '/';
  static const login = '/login';
  static const verifyCode = '/verify-code';
}