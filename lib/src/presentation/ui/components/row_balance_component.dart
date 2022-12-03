import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowBalanceComponent extends StatelessWidget {
  const RowBalanceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BackgroundWidget(
            height: 50,
            borderRadius: 15,
            isBordered: true,
            borderColor: Theme.of(context).primaryColor,
            horizontalPadding: 8,
            verticalPadding: 0,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget.medium(
                  context.getStrings.coinBalance,
                  context: context,
                  additionalStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: TextWidget.medium(
                    "10000",
                    context: context,
                    direction: TextDirection.ltr,
                    additionalStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const ImageLoaderWidget.fromAsset(
                  imageUrl: Assets.silverCoin,
                  height: 32,
                  width: 32,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: BackgroundWidget(
            height: 50,
            borderRadius: 15,
            isBordered: true,
            borderColor: Theme.of(context).colorScheme.surface,
            horizontalPadding: 8,
            verticalPadding: 0,
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget.medium(
                  context.getStrings.rialBalance,
                  context: context,
                  additionalStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: TextWidget.medium(
                    "10000",
                    context: context,
                    direction: TextDirection.ltr,
                    additionalStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const ImageLoaderWidget.fromAsset(
                  imageUrl: Assets.moneyBag,
                  height: 32,
                  width: 32,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
