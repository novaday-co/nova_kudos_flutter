import 'dart:async';

import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';

abstract class MyHive {

  Future<void> clearAll();

  Future<void> setPreferences(PreferencesEntity preferencesEntity);

  Future<PreferencesEntity?> getPreferences();

}
