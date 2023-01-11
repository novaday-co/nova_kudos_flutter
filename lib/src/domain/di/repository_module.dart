import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/auth_repository/auth_repository_impl.dart';
import 'package:nova_kudos_flutter/src/domain/repository/file_repository/file_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/file_repository/file_repository_impl.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository_impl.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository_impl.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository.dart';
import 'package:nova_kudos_flutter/src/domain/repository/user_repository/user_repository_impl.dart';

class RepositoryModule {
  static inject() {
    KiwiContainer().registerFactory<LocalStorageRepository>((container) =>
        LocalStorageRepositoryImpl(
            keeper: container.resolve(), hive: container.resolve()));

    KiwiContainer().registerFactory<AuthRepository>((container) =>
        AuthRepositoryImpl(
            authApi: container.resolve(),
            localStorageRepository:
            container.resolve<LocalStorageRepository>()));

    KiwiContainer().registerFactory<FileRepository>((container) =>
        FileRepositoryImpl(
            fileApi: container.resolve()));

    KiwiContainer().registerFactory<CompanyRepository>(
      (container) => CompanyRepositoryImpl(
        companyApi: container.resolve(),
      ),
    );
    KiwiContainer().registerFactory<UserRepository>(
      (container) => UserRepositoryImpl(
          userApi: container.resolve(),
          localStorageRepository: container.resolve<LocalStorageRepository>()),
    );
  }
}
