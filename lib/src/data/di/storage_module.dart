import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_entity/user_entity.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive.dart';
import 'package:nova_kudos_flutter/src/data/storage/hive/hive_impl.dart';
import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper_actions.dart';
import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper_impl.dart';
import 'package:path_provider/path_provider.dart';

class StorageModule {
  static Future<void> inject() async {
    await _injectSingletons();
    _injectInstances();
  }

  static Future<void> _injectSingletons() async {
    KiwiContainer().registerSingleton<FlutterSecureStorage>(
        (container) => const FlutterSecureStorage());
    await _injectAndInitHive();
  }

  static void _injectInstances() {
    KiwiContainer().registerInstance<KeeperActions>(KeeperImpl());
  }

  static Future<void> _injectAndInitHive() async {
    if (!kIsWeb) {
      var dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    } else {
      await Hive.initFlutter();
    }
    Hive
      ..registerAdapter(PreferencesEntityAdapter())
      ..registerAdapter(UserEntityAdapter());
    KiwiContainer().registerSingleton<MyHive>((container) => HiveImpl());
  }
}
