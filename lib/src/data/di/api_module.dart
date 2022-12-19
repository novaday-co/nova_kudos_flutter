import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/api/auth/auth_api_impl.dart';

class ApiModule {
  static Future<void> inject() async {
    KiwiContainer().registerFactory<AuthApi>((container) => AuthApiImpl());
  }
}
