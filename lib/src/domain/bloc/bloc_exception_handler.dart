import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/main.dart';
import 'package:nova_kudos_flutter/src/data/utils/exception.dart';
import 'package:nova_kudos_flutter/src/domain/repository/local_repository/local_storage_repository.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';

class BlocExceptionHandler extends BlocObserver {
  BlocExceptionHandler();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is UnauthorizedException) {
      //Todo: after getting token, pop to last page where the user was
      KiwiContainer().resolve<LocalStorageRepository>().deleteToken();
      Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!, Routes.login, (route) => false);
    }

    if (error is AccessDeniedException) {}

    super.onError(bloc, error, stackTrace);
  }
}
