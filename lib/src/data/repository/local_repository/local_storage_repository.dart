import 'package:nova_kudos_flutter/src/domain/model/settings/prefrences.dart';

abstract class LocalStorageRepository {

  Future<void> clearKeeper();

  Future<void> clearHive();

  Future<PreferencesModel> getPreferences();

  Future<void> setPreferences(PreferencesModel preferencesModel);

  Future<void> updatePreferences(PreferencesModel preferencesModel);
}
