import 'package:nova_kudos_flutter/src/data/di/api_module.dart';
import 'package:nova_kudos_flutter/src/data/di/network_module.dart';
import 'package:nova_kudos_flutter/src/data/di/repository_module.dart';
import 'package:nova_kudos_flutter/src/data/di/storage_module.dart';
import 'package:nova_kudos_flutter/src/presentation/di/presentation_injection.dart';

class Injector {
  static inject() async {
    await injectData();
    await _injectDomain();
    await _injectPresentation();
  }

  static Future<void> injectData() async {
    await RepositoryModule.inject();
    await StorageModule.inject();
    await NetworkModule.inject();
  }

  static _injectDomain() async {
    await ApiModule.inject();
  }

  static _injectPresentation() {
    PresentationInjection.inject();
  }
}