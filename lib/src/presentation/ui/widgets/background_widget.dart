import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;
  final bool isBordered;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? borderColor;
  final BoxShape? shape;
  final Clip clipBehaviour;

  const BackgroundWidget({
    Key? key,
    this.isBordered = false,
    this.child,
    this.verticalPadding,
    this.horizontalPadding,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.width,
    this.borderColor,
    this.onLongPress,
    this.shape,
    this.clipBehaviour = Clip.antiAlias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onBackground,
          borderRadius: shape == BoxShape.circle ? null:BorderRadius.circular(borderRadius ?? 0),
          shape: shape ?? BoxShape.rectangle,
          border: isBordered
              ? Border.all(
                  color: borderColor ?? Theme.of(context).colorScheme.outline)
              : null,
        ),
        clipBehavior: clipBehaviour,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.23),
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 0,
              vertical: verticalPadding ?? 0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
