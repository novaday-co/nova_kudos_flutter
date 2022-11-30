import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;
  final bool isBordered;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? borderColor;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: backgroundColor ?? Theme.of(context).colorScheme.onBackground,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isBordered
                ? borderColor ?? Theme.of(context).colorScheme.outline
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.23),
          onTap: onTap,
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
