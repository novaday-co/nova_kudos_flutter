import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/data/mapper/settings/preferences_entity_to_model.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive.dart';
import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper_actions.dart';
import 'package:nova_kudos_flutter/src/domain/model/settings/prefrences.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  LocalStorageRepositoryImpl({required this.keeper, required this.hive});

  final KeeperActions keeper;

  final MyHive hive;

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
}
