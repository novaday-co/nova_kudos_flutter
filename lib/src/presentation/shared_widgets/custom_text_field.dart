import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

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
              Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
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
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

            fillColor: Colors.white,
            counterText: "",
            suffixIcon: suffixIcon(),
            enabledBorder: _getEnabledBorder(context),
            focusedBorder: _getFocusedBorder(context),
            border: _getEnabledBorder(context),
            hintStyle: Styles.subtitle1(context).copyWith(fontSize: 16),
            labelStyle: Styles.subtitle1(context).copyWith(fontSize: 16),
            labelText: widget.label,
            hintText:  widget.hintText,
          ),
          onChanged: (value){
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
              SizedBox(height: 8.h),
              TextWidget.medium(
                widget.errorText!,
                context: context,
                additionalStyle: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
      ],
    );
  }

  InputBorder _getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(1000),
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
      borderRadius: const BorderRadius.all(
        Radius.circular(1000),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }

  InputBorder _getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(1000),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget suffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    }
    return Visibility(
      visible: controller.text.isNotEmpty,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 28.sp,
            width: 28.sp,
            child: IconWidget(
              icon: Icons.close,
              iconColor: Theme.of(context).colorScheme.tertiary,
              height: 28.sp,
              onPressed: () {
                controller.clear();
                setState(() {});
                widget.onChanged?.call("");
              },
              width: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}
