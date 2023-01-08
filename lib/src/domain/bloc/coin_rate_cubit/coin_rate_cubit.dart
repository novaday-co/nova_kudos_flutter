import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';

class CoinRateCubit extends BaseCubit<CoinRateState> {
  CompanyRepository companyRepository =
      KiwiContainer().resolve<CompanyRepository>();

  CoinRateCubit() : super(CoinRateStateInitState());

  void validateCoinRate(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const CoinRateValidationState.valid());
    } else {
      emit(const CoinRateValidationState.invalid());
    }
  }

  void getCoinRate() async {
    emit(const CoinRateGetRequestState.loading());
    await safeCall(
      apiCall: companyRepository.getCompanyCoinValue(companyId: 1),
      onData: (resultStatus, resultModel) {
        if (resultStatus == ResultStatus.success) {
          emit(CoinRateGetRequestState.success(resultModel!.data!));
        }
      },
      onError: (error) {
        emit(CoinRateGetRequestState.failed(error));
      },
    );
  }
}
