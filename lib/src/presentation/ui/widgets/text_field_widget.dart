import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class CustomTextField extends StatefulWidget {
  final String? errorText;
  final String? label;
  final String? hintText;
  final TextInputType? textInputType;
  final bool isObscure;
  final EdgeInsets? padding;
  final ValueChanged? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? initValue;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextStyle? labelStyle;
  final double borderRadius;

  const CustomTextField({
    Key? key,
    this.focusNode,
    this.textInputType,
    this.errorText,
    this.isObscure = false,
    this.autofocus,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.initValue,
    this.maxLines = 1,
    this.hintStyle,
    this.suffixIcon,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.readOnly = false,
    this.controller,
    this.hintText,
    this.inputFormatters,
    this.maxLength,
    this.label,
    this.labelStyle,
    this.borderRadius=1000
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    if (widget.initValue != null) {
      (controller
        ..text = widget.initValue!
        ..selection =
            TextSelection.collapsed(offset: widget.initValue!.length));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          autofocus: widget.autofocus ?? false,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          controller: controller,
          style: widget.textStyle ??
              Styles.bodyText1(context).copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w400,
              ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.maxLines == null
              ? TextInputType.multiline
              : widget.textInputType,
          obscureText: widget.isObscure,
          scrollPadding: EdgeInsets.zero,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: widget.inputFormatters,
          cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
          decoration: InputDecoration(
            contentPadding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            fillColor: Colors.white,
            filled: true,
            hoverColor: Colors.white,
            counterText: "",
            suffixIcon: suffixIcon(),
            prefixIcon: widget.prefixIcon,
            enabledBorder: _getEnabledBorder(context),
            focusedBorder: _getFocusedBorder(context),
            border: _getEnabledBorder(context),
            hintStyle: Styles.subtitle1(context).copyWith(fontSize: 16),
            labelStyle: Styles.subtitle1(context).copyWith(fontSize: 16),
            labelText: widget.label,
            hintText: widget.hintText,
          ),
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() {});
          },
          onTap: () {
            widget.onTap?.call();
            if (controller.selection ==
                TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length - 1))) {
              setState(() {
                controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              });
            }
          },
        ),
        if (widget.errorText != null)
          Column(
            children: [
              const SizedBox(height: 8),
              TextWidget.medium(
                widget.errorText!,
                context: context,
                additionalStyle: const TextStyle(fontSize: 14),
              ),
            ],
          ),
      ],
    );
  }

  InputBorder _getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius:  BorderRadius.all(
        Radius.circular(widget.borderRadius),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  InputBorder _getEnabledBorder(BuildContext context) {
    if (widget.errorText != null) {
      return _getErrorBorder(context);
    }
    return OutlineInputBorder(
      borderRadius:  BorderRadius.all(
        Radius.circular(widget.borderRadius),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }

  InputBorder _getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius:  BorderRadius.all(
        Radius.circular(widget.borderRadius),
      ),
      borderSide: BorderSide(
        color: widget.readOnly
            ? Theme.of(context).colorScheme.outline
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget suffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    }
    return Visibility(
      visible: controller.text.isNotEmpty && widget.readOnly == false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 28,
            width: 28,
            child: IconWidget(
              icon: Icons.close,
              iconColor: Theme.of(context).colorScheme.tertiary,
              height: 28,
              onPressed: () {
                controller.clear();
                setState(() {});
                widget.onChanged?.call("");
              },
              width: 28,
            ),
          ),
        ],
      ),
    );
  }
}
