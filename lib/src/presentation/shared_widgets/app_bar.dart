import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final String? title;
  final TextStyle? titleStyle;
  final bool hasBackButton;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onPressBack;
  final Color? statusBarColor;
  final Color? backgroundColor;

  const CustomAppbar({
    Key? key,
    this.title,
    this.titleStyle,
    this.leading,
    this.actions,
    this.hasBackButton = false,
    this.centerTitle = true,
    this.onPressBack,
    this.statusBarColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          Theme.of(context).appBarTheme.systemOverlayStyle!.copyWith(
                statusBarColor: statusBarColor,
              ),
      title: TextWidget.bold(
        title ?? "",
        context: context,
        additionalStyle: titleStyle,
      ),
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.background,
      leading: Visibility(
        visible: hasBackButton,
        replacement: leading ?? const SizedBox.shrink(),
        child: IconWidget(
          icon: Icons.arrow_back_ios_new,
          onPressed: onPressBack,
          rtlSupport: true,
        ),
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}
