import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/data/utils/exception.dart';

class BlocExceptionHandler extends BlocObserver {

  BlocExceptionHandler();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is UnauthorizedException) {

    }

    if (error is AccessDeniedException) {
    }

    if(error is CompleteProfileException){

    }

    super.onError(bloc, error, stackTrace);
  }
}
