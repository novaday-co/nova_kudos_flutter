import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitState());

}