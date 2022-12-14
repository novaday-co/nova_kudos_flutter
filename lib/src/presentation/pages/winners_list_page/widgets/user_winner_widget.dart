import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class UserWinnerWidget extends StatelessWidget {
  const UserWinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImageLoaderWidget.fromNetwork(
          imageUrl:
              'https://loremflickr.com/cache/resized/65535_51819602222_b063349f16_320_240_nofilter.jpg',
          width: 24,
          height: 24,
          boxShape: BoxShape.circle,
        ),
        const SizedBox(width: 5),
        TextWidget.medium(
          'محسن نیرومند',
          context: context,
          additionalStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        const Spacer(),
        TextWidget.medium(
          '16',
          context: context,
          additionalStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        const SizedBox(width: 6),
        const ImageLoaderWidget.fromAsset(imageUrl: Assets.goldMedal)
      ],
    );
  }
}
