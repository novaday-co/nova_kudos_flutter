import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowProfileHeader extends StatelessWidget {
  final String? title;
  final Widget? action;

  const RowProfileHeader({Key? key, this.title, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            const ImageLoaderWidget.fromNetwork(
              imageUrl: "https://loremflickr.com/640/360",
              boxShape: BoxShape.circle,
              height: 40,
              width: 40,
            ),
            const Spacer(),
            if (action != null) action!
          ],
        ),
        TextWidget.bold(
          title ?? "",
          context: context,
          additionalStyle: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
