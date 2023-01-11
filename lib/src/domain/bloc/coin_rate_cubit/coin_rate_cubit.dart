import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/company_repository/company_repository.dart';

class CoinRateCubit extends BaseCubit<CoinRateState> {
  CompanyRepository companyRepository;

  CoinRateCubit({
    required this.companyRepository,
  }) : super(CoinRateStateInitState());

  void validateCoinRate(String? input) {
    if (input != null && input.isNotEmpty) {
      emit(const CoinRateValidationState.valid());
    } else {
      emit(const CoinRateValidationState.invalid());
    }
  }

  void getCoinRate() async {
    emit(const CoinRateGetRequestState.loading());
    UserCompanyModel defaultCompany = await localStorageRepository.getUser();
    await safeCall(
      apiCall: companyRepository.getCompanyCoinValue(
          companyId: defaultCompany.companyId!),
      onSuccess: (resultModel) {
        emit(CoinRateGetRequestState.success(resultModel!.data!));
      },
      onFailed: (failedStatus, error) {
        emit(CoinRateGetRequestState.failed(error));
      },
    );
  }

  void postCoinRate(int coinValue) async {
    emit(const CoinRatePostRequestState.loading());
    UserCompanyModel defaultCompany = await localStorageRepository.getUser();
    await safeCall(
      apiCall: companyRepository.setCompanyCoinValue(
          companyId: defaultCompany.companyId!, coinValue: coinValue),
      onSuccess: (resultModel) {
        emit(CoinRatePostRequestState.success(resultModel!.data!));
      },
      onFailed: (failedStatus, error) {
        emit(CoinRatePostRequestState.failed(error));
      },
    );
  }
}
