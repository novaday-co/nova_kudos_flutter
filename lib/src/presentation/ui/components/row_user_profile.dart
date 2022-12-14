import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String? jobTitle;

  const RowUserProfile({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.jobTitle,
  }) : super(key: key);

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
          child: ImageLoaderWidget.fromNetwork(
            imageUrl: imageUrl,
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
              name,
              context: context,
              additionalStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            TextWidget.regular(
              jobTitle ?? "",
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
