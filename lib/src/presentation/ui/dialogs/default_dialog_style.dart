import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/button_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class DialogDefaultStyle extends StatefulWidget {
  final String title;
  final String question;
  final Future Function()? onAccept;
  final VoidCallback onReject;
  final Color? acceptButtonColor;
  final Color? rejectButtonColor;
  final String? acceptButtonText;
  final String? rejectButtonText;
  final Widget? child;

  const DialogDefaultStyle({
    Key? key,
    required this.title,
    required this.question,
    required this.onAccept,
    required this.onReject,
    this.acceptButtonColor,
    this.rejectButtonColor,
    this.acceptButtonText,
    this.rejectButtonText,
    this.child,
  }) : super(key: key);

  @override
  _DialogDefaultStyleState createState() => _DialogDefaultStyleState();
}

class _DialogDefaultStyleState extends State<DialogDefaultStyle> {
  ButtonLoadingStatus loadingStatus = ButtonLoadingStatus.normal;

  void changeLoadingState(ButtonLoadingStatus state) {
    setState(() {
      loadingStatus = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
          child: widget.child ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.bold(
                    widget.title,
                    context: context,
                    additionalStyle: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget.regular(
                    widget.question,
                    context: context,
                    additionalStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ],
              ),
        ),
        Container(
          color: Theme.of(context).colorScheme.onSecondary,
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: CustomButton.fill(
                  context: context,
                  height: 36,
                  additionalTextStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  text: widget.acceptButtonText,
                  backgroundColor: widget.acceptButtonColor ??
                      Theme.of(context).colorScheme.primary,
                  onPressed: widget.onAccept != null ? () async {
                    changeLoadingState(ButtonLoadingStatus.loading);
                    await widget.onAccept?.call();
                    changeLoadingState(ButtonLoadingStatus.normal);
                  } : null,
                  loadingStatus: loadingStatus,
                  borderRadius: 8,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomButton.fill(
                  context: context,
                  height: 36,
                  additionalTextStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  borderRadius: 8,
                  text: widget.rejectButtonText ?? context.getStrings.cancel,
                  backgroundColor: widget.rejectButtonColor ??
                      Theme.of(context).colorScheme.background,
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  loadingType: ButtonLoadingType.circular,
                  onPressed: widget.onReject,
                  isEnable: loadingStatus != ButtonLoadingStatus.loading,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
