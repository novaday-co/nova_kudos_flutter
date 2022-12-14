import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/data/repository/local_repository/local_storage_repository_impl.dart';

class RepositoryModule {
  static inject() {
    KiwiContainer().registerFactory<LocalStorageRepository>((container) =>
        LocalStorageRepositoryImpl(
            keeper: container.resolve(), hive: container.resolve()));
  }
}
