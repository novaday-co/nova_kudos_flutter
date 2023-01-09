import 'dart:async';

import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_entity/user_entity.dart';

abstract class MyHive {
  Future<void> clearAll();

  Future<void> setPreferences(PreferencesEntity preferencesEntity);

  Future<PreferencesEntity?> getPreferences();

  Future<void> setUser(UserCompanyEntity userEntity);

  Future<UserCompanyEntity?> getUser();

  Future<void> clearUser();
}
