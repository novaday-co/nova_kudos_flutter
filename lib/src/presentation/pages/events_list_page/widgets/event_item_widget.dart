import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_members_pictures.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class EventItemWidget extends StatelessWidget {
  final Function() onEventLongPress;

  const EventItemWidget({
    Key? key,
    required this.onEventLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: 16,
      horizontalPadding: 16,
      verticalPadding: 16,
      onLongPress: onEventLongPress,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextWidget.semiBold(
                  "شرکت در توسعه محصول",
                  context: context,
                  additionalStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              TextWidget.medium(
                DateTime.now().formattedJalaliDate,
                context: context,
                additionalStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onTertiary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const ImageLoaderWidget.fromAsset(
                      imageUrl: Assets.goldCoin,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 4),
                    TextWidget.semiBold(
                      "80",
                      context: context,
                      additionalStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const RowMembersPictures(
                maxLength: 6,
                images: [
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                  "https://loremflickr.com/640/360",
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
