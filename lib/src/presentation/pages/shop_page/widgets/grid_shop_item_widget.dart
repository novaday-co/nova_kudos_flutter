import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class GridShopItemWidget extends StatelessWidget {
  final ShopModel shopModel;
  final Function() onShopItemClick;

  const GridShopItemWidget({
    Key? key,
    required this.shopModel,
    required this.onShopItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      borderRadius: 16,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                ImageLoaderWidget.fromNetwork(
                  imageUrl: shopModel.image ?? '',
                  boxShape: BoxShape.circle,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.bold(
                      shopModel.title ?? '',
                      context: context,
                      additionalStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextWidget.regular(
                      sprintf(
                        context.getStrings.phValidity,
                        [shopModel.endAt?.formattedJalaliDate],
                      ),
                      context: context,
                      additionalStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget.regular(
                          sprintf(
                            context.getStrings.phCount,
                            [shopModel.price],
                          ),
                          context: context,
                          additionalStyle: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const ImageLoaderWidget.fromAsset(
                          imageUrl: Assets.goldCoin,
                          width: 16,
                          height: 16,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            CustomButton.fill(
              context: context,
              text: sprintf(
                context.getStrings.phGetRewardWithCoin,
                [shopModel.price],
              ),
              height: 32,
              additionalTextStyle: const TextStyle(fontSize: 12),
              onPressed: onShopItemClick,
            ),
          ],
        ),
      ),
    );
  }
}