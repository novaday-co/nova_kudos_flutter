abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const verifyCode = _Paths.verifyCode;
  static const completeProfile = _Paths.completeProfile;
  static const notification = _Paths.notification;
  static const profile = _Paths.profile;
  static const landingPage = _Paths.landingPage;
  static const createProductPage = _Paths.createProductPage;
  static const transactionsPage = _Paths.transactionsPage;
  static const eventsListPage = _Paths.eventsListPage;
  static const pullsListPage = _Paths.pullsListPage;
  static const winnersListPage = _Paths.winnersListPage;
  static const coinRatePage = _Paths.coinRatePage;
}

abstract class _Paths {
  static const splash = '/';
  static const login = '/login';
  static const verifyCode = '/verify-code';
  static const completeProfile = '/complete-profile';
  static const notification = '/notification';
  static const profile = '/profile';
  static const landingPage = '/landing-page';
  static const createProductPage = '/create-product';
  static const transactionsPage = '/transaction';
  static const pullsListPage = '/pulls';
  static const eventsListPage = '/events';
  static const winnersListPage = '/winners';
  static const coinRatePage = '/coin-rate';

}