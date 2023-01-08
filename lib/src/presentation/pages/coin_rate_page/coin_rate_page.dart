import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
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
                label: 'نرخ هر سکه',
                hintText: "نرخ هر سکه را وارد کنید",
                textInputType: TextInputType.number,
                prefixIcon: IconWidget(
                  icon: Assets.iconDollarCircle,
                  padding: 8,
                  iconColor: Theme.of(context).colorScheme.onTertiary,
                ),
                borderRadius: 16,
                onChanged: (value) {
                  cubit.validateCoinRate(value);
                },
              ),
              TextWidget.regular(
                context.getStrings
                    .currentCoinRate(state.coinSystemModel.coinValue ?? 0),
                context: context,
                additionalStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onTertiary),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: context.getStrings.valueOfSystem,
                borderRadius: 16,
                readOnly: true,
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
                initValue: state.coinSystemModel.systemValue != null
                    ? state.coinSystemModel.systemValue.toString()
                    : null,
              ),
              const SizedBox(height: 28),
              BlocConsumer<CoinRateCubit, CoinRateState>(
                listener: _listenToLoginState,
                // listenWhen: _listenWhenToLoginState,
                 buildWhen: _buildWhenCoinInput,
                builder: (context, state) => CustomButton.fill(
                  context: context,
                  text: context.getStrings.update,
                  loadingType: ButtonLoadingType.circular,
                  loadingStatus: _buttonLoadingStatus(state),
                  isEnable: state is CoinRateValidState,
                  onPressed: () {},
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
}

ButtonLoadingStatus _buttonLoadingStatus(CoinRateState state) {
  if (state is LoadingCoinRateGetRequestState) {
    return ButtonLoadingStatus.loading;
  }
  if (state is SuccessCoinRateGetRequestState) {
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
      current is CoinRateGetRequestState;
}

///endregion

/// region Bloc Listeners

void _listenToLoginState(BuildContext context, CoinRateState state) {}

///endregion
