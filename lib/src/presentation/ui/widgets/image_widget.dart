import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

enum ImageType { asset, file, network }

class ImageLoaderWidget extends StatelessWidget {
  final String imageUrl;
  final ImageType imageType;
  final BoxShape boxShape;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onTap;
  final bool hasTag;
  final Widget? tagWidget;
  final Alignment? tagAlignment;

  const ImageLoaderWidget({
    Key? key,
    required this.imageUrl,
    required this.imageType,
    this.boxShape = BoxShape.rectangle,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.borderRadius,
    this.onTap,
    this.hasTag = false,
    this.tagWidget,
    this.tagAlignment,
  }) : super(key: key);

  const ImageLoaderWidget.fromAsset({
    Key? key,
    required this.imageUrl,
    this.boxShape = BoxShape.rectangle,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.borderRadius,
    this.onTap,
    this.hasTag = false,
    this.tagWidget,
    this.tagAlignment,
  })  : imageType = ImageType.asset,
        super(key: key);

  const ImageLoaderWidget.fromNetwork({
    Key? key,
    required this.imageUrl,
    this.boxShape = BoxShape.rectangle,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.borderRadius,
    this.onTap,
    this.hasTag = false,
    this.tagWidget,
    this.tagAlignment,
  })  : imageType = ImageType.network,
        super(key: key);

  const ImageLoaderWidget.fromFile({
    Key? key,
    required this.imageUrl,
    this.boxShape = BoxShape.rectangle,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.borderRadius,
    this.onTap,
    this.hasTag = false,
    this.tagWidget,
    this.tagAlignment,
  })  : imageType = ImageType.file,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Container(
              height: height,
              width: width,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: boxShape == BoxShape.circle
                    ? null
                    : BorderRadius.circular(borderRadius ?? 0),
                shape: boxShape,
              ),
              child: Builder(
                builder: (context) {
                  switch (imageType) {
                    case ImageType.asset:
                      return Image.asset(
                        imageUrl,
                        fit: boxFit,
                        width: width,
                        height: height,
                        errorBuilder: (context, error, stackTrace) => _errorWidget(context)
                      );
                    case ImageType.file:
                      return Image.file(
                        File(imageUrl),
                        fit: boxFit,
                        width: width,
                        height: height,
                        errorBuilder: (context, error, stackTrace) => _errorWidget(context)
                      );
                    case ImageType.network:
                      return CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: boxFit,
                        errorWidget: (context, url, error) => _errorWidget(context),
                        height: height,
                        width: width,
                        placeholder: (context, url) =>
                            boxShape == BoxShape.circle
                                ? SkeletonWidget.circular(
                                    width: width ?? 50,
                                    height: height ?? 50,
                                  )
                                : SkeletonWidget.rectangular(
                                    width: width ?? 50,
                                    height: height ?? 50,
                                  ),
                      );
                  }
                },
              ),
            ),
          ),
          if (hasTag)
            Align(
              alignment: tagAlignment ?? Alignment.bottomCenter,
              child: tagWidget,
            )
        ],
      ),
    );
  }

  Widget _errorWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        Assets.iconNotFound,
        fit: BoxFit.contain,
        height: height,
        width: width,
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
    );
  }
}
