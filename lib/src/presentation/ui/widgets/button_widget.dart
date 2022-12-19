import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/button_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

enum ButtonLoadingType { percentage, circular }

enum ButtonLoadingStatus { complete, loading, normal }

class CustomButton extends StatefulWidget {
  final BuildContext context;
  final Color? foregroundColor;
  final bool? isPrimaryCircularLoading;
  final TextStyle? additionalTextStyle;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String? text;
  final double? width;
  final double? height;
  final ButtonLoadingType? loadingType;
  final bool isEnable;
  final ButtonLoadingStatus? loadingStatus;
  final double? borderRadius;

  CustomButton.fill({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.height,
    this.text,
    this.isPrimaryCircularLoading,
    this.borderRadius,
    this.isEnable = true,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
    Color? backgroundColor,
  })  : style = ButtonStyles.fill(
          context: context,
          backgroundColor: backgroundColor,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
          borderRadius: borderRadius,
        ),
        super(key: key);

  CustomButton.outline({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.height,
    this.text,
    this.isPrimaryCircularLoading,
    this.borderRadius,
    this.isEnable = true,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
    Color? borderColor,
  })  : style = ButtonStyles.outline(
          context: context,
          borderColor: borderColor,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
          borderRadius: borderRadius,
        ),
        super(key: key);

  CustomButton.text({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.height,
    this.text,
    this.isPrimaryCircularLoading,
    this.borderRadius,
    this.isEnable = true,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
  })  : style = ButtonStyles.text(
          context: context,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
          borderRadius: borderRadius,
        ),
        super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  ButtonLoadingStatus buttonLoadingStatus = ButtonLoadingStatus.normal;

  @override
  void initState() {
    super.initState();
    postFrameCallback(() {
      buttonLoadingStatus = widget.loadingStatus ?? ButtonLoadingStatus.normal;
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loadingStatus != null) {
      buttonLoadingStatus = widget.loadingStatus!;
      setState(() {});
      checkForResetState();
    }
  }

  void checkForResetState() {
    if(widget.loadingStatus == ButtonLoadingStatus.complete){
      Future.delayed(const Duration(milliseconds: 600), () {
        buttonLoadingStatus = ButtonLoadingStatus.normal;
        setState(() {});
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 48,
      width: widget.width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: widget.isEnable
            ? () {
                if (buttonLoadingStatus != ButtonLoadingStatus.loading) {
                  widget.onPressed?.call();
                }
              }
            : null,
        style: widget.style,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
          ),
          child: Builder(
            builder: (context) {
              switch (widget.loadingType) {
                case ButtonLoadingType.percentage:
                  return percentageLoading(context);
                default:
                  return circularLoading(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buttonTitleWidget(BuildContext context) {
    return TextWidget(
      widget.text ?? "",
      context: context,
    );
  }

  Widget circularLoading(BuildContext context) {
    if (buttonLoadingStatus == ButtonLoadingStatus.loading) {
      return Loading(
        primaryLoading: widget.isPrimaryCircularLoading,
      );
    }
    return buttonTitleWidget(context);
  }

  Widget percentageLoading(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          width: _percentageLoadingWidth,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(1000)),
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        Center(child: buttonTitleWidget(context)),
      ],
    );
  }

  double get _percentageLoadingWidth {
    switch (buttonLoadingStatus) {
      case ButtonLoadingStatus.complete:
        return widget.context.screenWidth;
      case ButtonLoadingStatus.loading:
        return widget.context.screenWidth * .3;
      default:
        return 0;
    }
  }

}
