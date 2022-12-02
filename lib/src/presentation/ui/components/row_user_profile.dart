import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowUserProfile extends StatelessWidget {
  const RowUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            shape: BoxShape.circle,
          ),
          child: const ImageLoaderWidget.fromNetwork(
            imageUrl: 'https://loremflickr.com/640/360',
            width: 50,
            height: 50,
            boxShape: BoxShape.circle,
            boxFit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.bold(
              'سارا تهرانی',
              context: context,
              additionalStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            TextWidget.regular(
              'برنامه نویس موبایل',
              context: context,
              additionalStyle: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        )
      ],
    );
  }
}
