import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_members_pictures.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class VoluntaryItemWidget extends StatelessWidget {
  final int index;

  const VoluntaryItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      height: 100,
      width: 180,
      horizontalPadding: 8,
      verticalPadding: 10,
      backgroundColor: context.getColorByIndex(index).withOpacity(0.1),
      borderRadius: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextWidget.medium(
              "کمک برای تولید محتوا",
              context: context,
              maxLines: 2,
              additionalStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontSize: 14),
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: RowMembersPictures(
                  length: 5,
                  images: [
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                    "https://loremflickr.com/640/360",
                  ],
                ),
              ),
              TextWidget.bold(
                "80",
                context: context,
                additionalStyle: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 4,
              ),
              const ImageLoaderWidget.fromAsset(
                imageUrl: Assets.goldCoin,
                height: 20,
                width: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
