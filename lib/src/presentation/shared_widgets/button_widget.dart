import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/button_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

enum ButtonLoadingType { percentage, circular }

enum ButtonLoadingStatus { complete, loading, normal }

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final Color? foregroundColor;
  final bool? isPrimaryCircularLoading;
  final TextStyle? additionalTextStyle;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String? text;
  final double? width;
  final ButtonLoadingType? loadingType;
  final ButtonLoadingStatus? loadingStatus;

  CustomButton.fill({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.text,
    this.isPrimaryCircularLoading,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
    Color? backgroundColor,
  })  : style = ButtonStyles.fill(
          context: context,
          backgroundColor: backgroundColor,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
        ),
        super(key: key);

  CustomButton.outline({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.text,
    this.isPrimaryCircularLoading,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
    Color? borderColor,
  })  : style = ButtonStyles.outline(
          context: context,
          borderColor: borderColor,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
        ),
        super(key: key);

  CustomButton.text({
    Key? key,
    required this.context,
    this.foregroundColor,
    this.additionalTextStyle,
    this.onPressed,
    this.width,
    this.text,
    this.isPrimaryCircularLoading,
    this.loadingType = ButtonLoadingType.circular,
    this.loadingStatus = ButtonLoadingStatus.normal,
  })  : style = ButtonStyles.text(
          context: context,
          additionalTextStyle: additionalTextStyle,
          foregroundColor: foregroundColor,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: onPressed != null ? (){
          if(loadingStatus == ButtonLoadingStatus.normal){
            onPressed!.call();
          }
        }:null,
        style: style,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
          ),
          child: Builder(
            builder: (context) {
              switch (loadingType) {
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
      text ?? "",
      context: context,
    );
  }

  Widget circularLoading(BuildContext context) {
    if (loadingStatus == ButtonLoadingStatus.loading) {
      return Loading(
        primaryLoading: isPrimaryCircularLoading,
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
    switch (loadingStatus) {
      case ButtonLoadingStatus.complete:
        return context.screenWidth;
      case ButtonLoadingStatus.loading:
        return context.screenWidth * .3;
      default:
        return 0;
    }
  }
}
