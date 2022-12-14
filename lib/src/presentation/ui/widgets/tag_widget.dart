import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class TagWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final String? value;
  final BoxShape boxShape;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? padding;
  final TextStyle? textStyle;

  const TagWidget.circle({
    Key? key,
    this.backgroundColor,
    this.child,
    this.value,
    this.height,
    this.width,
    this.borderRadius,
    this.padding, this.textStyle,
  })  : boxShape = BoxShape.circle,
        super(key: key);

  const TagWidget.rectangle({
    Key? key,
    this.backgroundColor,
    this.child,
    this.value,
    this.height,
    this.width,
    this.borderRadius,
    this.padding, this.textStyle,
  })  : boxShape = BoxShape.rectangle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding ?? 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: boxShape,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
      ),
      child: child ??
          TextWidget.medium(
            value ?? "",
            context: context,
            additionalStyle: textStyle ?? const TextStyle(fontSize: 12),
          ),
    );
  }
}
