import 'package:hive_flutter/hive_flutter.dart';
import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/tags.dart';

class HiveImpl extends MyHive {

  @override
  Future<void> clearAll() async {
    await Hive.deleteFromDisk();
  }

  @override
  Future<PreferencesEntity?> getPreferences() async {
    final box = await Hive.openBox(Tags.preferencesBoxKey);
    return box.get(Tags.preferencesBoxKey);
  }

  @override
  Future<void> setPreferences(PreferencesEntity preferencesEntity) async {
    final box = await Hive.openBox(Tags.preferencesBoxKey);
    return box.put(Tags.preferencesBoxKey, preferencesEntity);
  }

}
