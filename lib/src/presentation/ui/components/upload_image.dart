import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/tag_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class UploadImage extends StatelessWidget {
  final VoidCallback? onClick;
  final String? image;
  final bool isLocalFile;

  const UploadImage({
    Key? key,
    this.onClick,
    this.image,
    required this.isLocalFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      height: 80,
      width: context.screenWidth,
      borderRadius: 16,
      onTap: onClick,
      child: image != null
          ? ImageLoaderWidget(
              imageUrl: image!,
              boxFit: BoxFit.cover,
              boxShape: BoxShape.rectangle,
              width: context.screenWidth,
              imageType: isLocalFile ? ImageType.file : ImageType.network,
              hasTag: true,
              tagAlignment: Alignment.bottomRight,
              tagWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: onClick,
                  child: TagWidget.rectangle(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    value: context.getStrings.changePicture,
                    padding: 4,
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  icon: Assets.iconGallery,
                  size: 24,
                  height: 24,
                  width: 24,
                  iconColor: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                const SizedBox(height: 4),
                TagWidget.rectangle(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  value: context.getStrings.eventPicture,
                  padding: 4,
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
    );
  }
}
