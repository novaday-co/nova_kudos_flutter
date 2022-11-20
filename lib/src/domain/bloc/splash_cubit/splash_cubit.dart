import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(SplashInitState());

}