import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/company/coin/coin_system_model.dart';

part 'coin_rate_state.freezed.dart';

abstract class CoinRateState {}

class CoinRateStateInitState extends CoinRateState {}

@freezed
class CoinRateValidationState extends CoinRateState {
  const factory CoinRateValidationState.valid() = CoinRateValidState;

  const factory CoinRateValidationState.invalid() = CoinRateInValidState;
}

@freezed
class CoinRateGetRequestState extends CoinRateValidationState {
  const factory CoinRateGetRequestState.loading() =
      LoadingCoinRateGetRequestState;

  const factory CoinRateGetRequestState.success(
      CompanyCoinSystemModel coinSystemModel) = SuccessCoinRateGetRequestState;

  const factory CoinRateGetRequestState.failed(String? error) =
      FailedCoinRateGetRequestState;
}

@freezed
class CoinRatePostRequestState extends CoinRateState {
  const factory CoinRatePostRequestState.loading() =
      LoadingCoinRatePostRequestState;

  const factory CoinRatePostRequestState.success(
      CompanyCoinSystemModel coinSystemModel) = SuccessCoinRatePostRequestState;

  const factory CoinRatePostRequestState.failed(String? error) =
      FailedCoinRatePostRequestState;
}
