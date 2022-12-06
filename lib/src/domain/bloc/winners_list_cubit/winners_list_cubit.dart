import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/winners_list_cubit/winners_list_state.dart';

class WinnersListCubit extends Cubit<WinnersListState>{
  WinnersListCubit() : super(InitWinnersListState());

}