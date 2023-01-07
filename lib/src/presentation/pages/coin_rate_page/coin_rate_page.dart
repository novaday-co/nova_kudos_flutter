import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/coin_rate_cubit/coin_rate_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_field_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class CoinRatePage extends BaseStatelessWidget<CoinRateCubit> {
  const CoinRatePage({Key? key}) : super(key: key);

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
  void onBuild(BuildContext context) {
    return super.onBuild(context);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: 'نرخ هر سکه',
          hintText: "نرخ هر سکه را وارد کنید",
          prefixIcon: IconWidget(
            icon: Assets.iconDollarCircle,
            padding: 8,
            iconColor: Theme.of(context).colorScheme.onTertiary,
          ),
          borderRadius: 16,
          onChanged: (value) {},
        ),
        TextWidget.regular(
          'نرخ فعلی هر سکه 20000 ریال است',
          context: context,
          additionalStyle: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onTertiary
          ),
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
          initValue: "10",
        ),
      ],
    );
  }

  ///region Bloc When Conditions Functions

  ///endregion
}
