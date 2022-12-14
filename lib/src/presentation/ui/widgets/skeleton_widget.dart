import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/colors/colors.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonWidget extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shape;

  const SkeletonWidget.rectangular({
    Key? key,
    required this.width,
    required this.height,
  })  : shape = BoxShape.rectangle,
        super(key: key);

  const SkeletonWidget.circular({
    Key? key,
    required this.width,
    required this.height,
  })  : shape = BoxShape.circle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      shimmerColor: context.isDark
          ? ShimmerHighlightColor.dark
          : ShimmerHighlightColor.light,
      shimmerDuration: 1500,
      gradientColor:
          context.isDark ? ShimmerBaseColor.dark : ShimmerBaseColor.light,
      borderRadius: shape == BoxShape.circle
          ? const BorderRadius.all(Radius.circular(100))
          : const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : const BorderRadius.all(Radius.circular(10)),
          color:
              context.isDark ? ShimmerBaseColor.dark : ShimmerBaseColor.light,
        ),
      ),
    );
  }
}
