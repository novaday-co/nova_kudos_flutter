import 'package:nova_kudos_flutter/src/domain/model/settings/prefrences.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

abstract class LocalStorageRepository {
  Future<void> clearLocalStorage();

  Future<void> clearKeeper();

  Future<void> clearHive();

  Future<PreferencesModel> getPreferences();

  Future<void> setPreferences(PreferencesModel preferencesModel);

  Future<void> updatePreferences(PreferencesModel preferencesModel);

  Future<void> setUser(UserModel userModel);

  Future<UserModel> getUser();

  Future<void> clearUser();

  Future<void> setToken(String token);

  Future<String?> getToken();
}
