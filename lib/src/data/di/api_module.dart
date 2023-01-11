import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/api/auth/auth_api.dart';
import 'package:nova_kudos_flutter/src/data/api/auth/auth_api_impl.dart';
import 'package:nova_kudos_flutter/src/data/api/file/file_api.dart';
import 'package:nova_kudos_flutter/src/data/api/file/file_api_impl.dart';
import 'package:nova_kudos_flutter/src/data/api/company/company_api.dart';
import 'package:nova_kudos_flutter/src/data/api/company/company_api_impl.dart';
import 'package:nova_kudos_flutter/src/data/api/user/user_api.dart';
import 'package:nova_kudos_flutter/src/data/api/user/user_api_impl.dart';

class ApiModule {
  static Future<void> inject() async {
    KiwiContainer().registerFactory<AuthApi>((container) => AuthApiImpl());
    KiwiContainer().registerFactory<FileApi>((container) => FileApiImpl());
    KiwiContainer()
        .registerFactory<CompanyApi>((container) => CompanyApiImpl());
    KiwiContainer()
        .registerFactory<UserApi>((container) => UserApiImpl());
  }
}
