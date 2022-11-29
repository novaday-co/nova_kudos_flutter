import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

const double PADDING_FROM_TOP = 32;

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
      title: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: PADDING_FROM_TOP),
        child: TextWidget.bold(
          title ?? "",
          context: context,
          additionalStyle: const TextStyle(fontSize: 18).merge(titleStyle),
        ),
      ),
      centerTitle: centerTitle,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: PADDING_FROM_TOP),
                child: Row(
                  children: actions!,
                ),
              )
            ]
          : null,
      titleSpacing: 0,
      toolbarHeight: 120,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.background,
      leading: hasBackButton
          ? Padding(
              padding: const EdgeInsets.only(top: PADDING_FROM_TOP),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    icon: Assets.arrowRight,
                    onPressed: onPressBack,
                    borderRadius: 1000,
                    height: 40,
                    width: 40,
                    size: 5,
                    hasBorder: true,
                    borderColor: Theme.of(context).colorScheme.outline,
                  ),
                ],
              ),
            )
          : (leading != null
              ? Padding(
                  padding: const EdgeInsets.only(top: PADDING_FROM_TOP),
                  child: leading,
                )
              : null),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
