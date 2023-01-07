import 'package:nova_kudos_flutter/src/domain/bloc/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_state.dart';

class CoinRateCubit extends BaseCubit<CoinRateState> {
  CoinRateCubit() : super(CoinRateStateInitState());
}
