import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/data/mapper/settings/preferences_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/data/mapper/user/user_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive.dart';
import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper_actions.dart';
import 'package:nova_kudos_flutter/src/domain/mapper/user/user_model_to_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/settings/prefrences.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final KeeperActions keeper;
  final MyHive hive;

  LocalStorageRepositoryImpl({
    required this.keeper,
    required this.hive,
  });

  @override
  Future<void> clearLocalStorage() async {
    await clearKeeper();
    await clearHive();
  }

  @override
  Future<void> clearKeeper() async {
    await keeper.deleteAll();
  }

  @override
  Future<void> clearHive() async {
    await hive.clearAll();
  }

  @override
  Future<PreferencesModel> getPreferences() async {
    PreferencesEntity? preferencesEntity = await hive.getPreferences();
    return preferencesEntity?.mapTopModel() ?? PreferencesModel();
  }

  @override
  Future<void> setPreferences(PreferencesModel preferencesModel) {
    return hive.setPreferences(preferencesModel.mapToEntity());
  }

  @override
  Future<void> updatePreferences(PreferencesModel preferencesModel) async {
    PreferencesEntity? preferencesEntity = await hive.getPreferences();

    final Map<String, dynamic> prefJson = {
      if (preferencesEntity != null) ...preferencesEntity.toJson(),
      ...preferencesModel.mapToEntity().toJson()
    };

    await hive.setPreferences(PreferencesEntity.fromJson(prefJson));
  }

  @override
  Future<void> clearUser() => hive.clearUser();

  @override
  Future<String?> getToken() => keeper.getToken();

  @override
  Future<void> setToken(String token) => keeper.setToken(token);

  @override
  Future<void> setUser(UserModel userModel) async =>
      await hive.setUser(userModel.mapToEntity);

  @override
  Future<UserModel> getUser() async => (await hive.getUser())!.mapToModel;
}
