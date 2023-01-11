import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_state.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_snackbars_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class CoinRatePage extends BaseStatefulWidget {
  const CoinRatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CoinRatePageState();
}

class _CoinRatePageState
    extends BaseStatefulWidgetState<CoinRatePage, CoinRateCubit> {
  int coinValue = 0;
  late TextEditingController systemValueController;

  @override
  void initState() {
    systemValueController = TextEditingController();
    super.initState();
  }

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      title: context.getStrings.manageCoinFee,
      hasBackButton: true,
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  void initialization() {
    cubit.getCoinRate();
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<CoinRateCubit, CoinRateState>(
      buildWhen: _buildWhenPage,
      builder: (context, state) {
        if (state is SuccessCoinRateGetRequestState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: context.getStrings.coinRate,
                hintText: context.getStrings.enterCoinRate,
                textInputType: TextInputType.number,
                prefixIcon: IconWidget(
                  icon: Assets.iconDollarCircle,
                  padding: 8,
                  iconColor: Theme.of(context).colorScheme.onTertiary,
                ),
                borderRadius: 16,
                onChanged: (value) {
                  cubit.validateCoinRate(value);
                  coinValue = int.parse(value);
                },
              ),
              BlocBuilder<CoinRateCubit, CoinRateState>(
                buildWhen: _buildWhenCoinRateUpdated,
                builder: (context, state) {
                  return TextWidget.regular(
                    context.getStrings
                        .currentCoinRate(state is SuccessCoinRateGetRequestState
                            ? state.coinSystemModel.coinValue ?? 0
                            : state is SuccessCoinRatePostRequestState
                                ? state.coinSystemModel.coinValue ?? 0
                                : 0),
                    context: context,
                    additionalStyle: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onTertiary),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<CoinRateCubit, CoinRateState>(
                buildWhen: _buildWhenCoinRateUpdated,
                builder: (context, state) {
                  return CustomTextField(
                    label: context.getStrings.valueOfSystem,
                    borderRadius: 16,
                    readOnly: true,
                    controller: systemValueController,
                    suffixIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget.regular(
                          context.getStrings.titleRial,
                          context: context,
                          additionalStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                    initValue: state
                        .isA<SuccessCoinRateGetRequestState>()
                        ?.coinSystemModel
                        .systemValue
                        .toString(),
                  );
                },
              ),
              const SizedBox(height: 28),
              BlocConsumer<CoinRateCubit, CoinRateState>(
                listener: _listenToUpdateCoinSystem,
                listenWhen: _listenWhenUpdateCoinSystem,
                buildWhen: _buildWhenCoinInput,
                builder: (context, state) => CustomButton.fill(
                  context: context,
                  text: context.getStrings.update,
                  loadingType: ButtonLoadingType.circular,
                  loadingStatus: _buttonLoadingStatus(state),
                  isEnable: state is CoinRateValidState ||
                      state is SuccessCoinRatePostRequestState,
                  onPressed: () {
                    cubit.postCoinRate(coinValue);
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Loading(
              primaryLoading: true,
            ),
          );
        }
      },
    );
  }

  ButtonLoadingStatus _buttonLoadingStatus(CoinRateState state) {
    if (state is LoadingCoinRatePostRequestState) {
      return ButtonLoadingStatus.loading;
    }
    if (state is SuccessCoinRatePostRequestState) {
      return ButtonLoadingStatus.complete;
    }
    return ButtonLoadingStatus.normal;
  }

  ///region Bloc When Conditions Functions

  bool _buildWhenPage(CoinRateState previous, CoinRateState current) {
    return current is CoinRateGetRequestState;
  }

  bool _buildWhenCoinInput(CoinRateState previous, CoinRateState current) {
    return current is CoinRateValidationState ||
        current is CoinRatePostRequestState;
  }

  bool _buildWhenCoinRateUpdated(CoinRateState previous, CoinRateState current) {
    return current is SuccessCoinRatePostRequestState ||
        current is SuccessCoinRateGetRequestState;
  }

  ///endregion

  /// region Bloc Listeners

  void _listenToUpdateCoinSystem(BuildContext context, CoinRateState state) {
    if (state is SuccessCoinRatePostRequestState) {
      systemValueController.text = state.coinSystemModel.systemValue.toString();
      KudosSnackBars.showSnackBar(
        snackType: SnackType.success,
        title: context.getStrings
            .updateCoinRate(state.coinSystemModel.coinValue ?? 0),
        context: context,
      );
    } else if (state is FailedCoinRatePostRequestState) {
      KudosSnackBars.showSnackBar(
        snackType: SnackType.failure,
        title: state.error ?? "",
        context: context,
      );
    }
  }

  ///endregion

  /// region Listen When

  bool _listenWhenUpdateCoinSystem(
      CoinRateState previous, CoinRateState current) {
    return current is SuccessCoinRatePostRequestState;
  }

  ///endregion
}
