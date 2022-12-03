import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final dynamic icon;
  final Color? iconColor;
  final double? size;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool hasBorder;
  final bool rtlSupport;
  final Color? borderColor;
  final double? borderRadius;
  final double? padding;
  final double? width;
  final double? height;
  final BoxShape boxShape;

  const IconWidget({
    Key? key,
    this.icon,
    this.iconColor,
    this.onPressed,
    this.size,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.hasBorder = false,
    this.rtlSupport = false,
    this.width,
    this.height,
    this.boxShape = BoxShape.rectangle,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: boxShape,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        border: hasBorder
            ? Border.all(
                color: borderColor ?? Colors.transparent,
              )
            : null,
      ),
      child: InkWell(
        onTap: onPressed,
        radius: 20,
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius!)
            : (boxShape == BoxShape.circle
                ? BorderRadius.circular(10000)
                : null),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: _configIcon(context),
        ),
      ),
    );
  }

  Widget _configIcon(BuildContext context) {
    if (icon is IconData) {
      return Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.tertiary,
        size: size ?? 18,
      );
    }
    return SvgPicture.asset(
      icon,
      color: iconColor ?? Theme.of(context).colorScheme.tertiary,
      height: size ?? 18,
      width: size ?? 18,
      matchTextDirection: rtlSupport,
    );
  }
}
