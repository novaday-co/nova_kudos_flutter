import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyle fill({
    required BuildContext context,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? additionalTextStyle,
  }) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.surfaceTint;
            }
            return backgroundColor ?? Theme.of(context).colorScheme.primary;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith((state) {
          if (state.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.tertiaryContainer;
          }
          return foregroundColor ??
              Theme.of(context).colorScheme.onTertiaryContainer;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).hoverColor),
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.resolveWith(
          (state) {
            if (state.contains(MaterialState.disabled)) {
              return Styles.button(context)
                  .copyWith(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: 18.0)
                  .merge(additionalTextStyle);
            }
            return Styles.button(context)
                .copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    fontSize: 18.0)
                .merge(additionalTextStyle);
          },
        ),
      );

  static ButtonStyle outline({
    required BuildContext context,
    Color? borderColor,
    Color? foregroundColor,
    TextStyle? additionalTextStyle,
  }) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((state) {
          if (state.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.tertiaryContainer;
          }
          return foregroundColor ?? Theme.of(context).colorScheme.primary;
        }),
        overlayColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).hoverColor),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            Color color = borderColor ?? Theme.of(context).colorScheme.primary;
            if (states.contains(MaterialState.disabled)) {
              color = Theme.of(context).colorScheme.surfaceTint;
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
              side: BorderSide(color: color, width: 2),
            );
          },
        ),
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.resolveWith(
          (state) {
            Color textColor = Theme.of(context).colorScheme.onTertiaryContainer;
            if (state.contains(MaterialState.disabled)) {
              textColor = Theme.of(context).colorScheme.tertiaryContainer;
            }
            return Styles.button(context)
                .copyWith(color: textColor, fontSize: 18.0)
                .merge(additionalTextStyle);
          },
        ),
      );

  static ButtonStyle text({
    required BuildContext context,
    Color? foregroundColor,
    TextStyle? additionalTextStyle,
  }) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((state) {
          if (state.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.tertiaryContainer;
          }
          return foregroundColor ?? Theme.of(context).colorScheme.primary;
        }),
        overlayColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).hoverColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        )),
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.resolveWith(
          (state) {
            Color textColor = Theme.of(context).colorScheme.onTertiaryContainer;
            if (state.contains(MaterialState.disabled)) {
              textColor = Theme.of(context).colorScheme.tertiaryContainer;
            }
            return Styles.button(context)
                .copyWith(color: textColor, fontSize: 18.0)
                .merge(additionalTextStyle);
          },
        ),
      );
}
