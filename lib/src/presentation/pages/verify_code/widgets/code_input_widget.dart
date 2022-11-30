import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeInputWidget extends StatefulWidget {
  final Function(String value) onSubmitted;
  final Function(String value)? onChanged;
  final bool isEnabled;
  final bool hasError;
  final String? errorText;

  const CodeInputWidget({
    Key? key,
    required this.onSubmitted,
    this.onChanged,
    this.isEnabled = true,
    this.hasError = false,
    this.errorText
  }) : super(key: key);

  @override
  State<CodeInputWidget> createState() => _CodeInputWidgetState();
}

class _CodeInputWidgetState extends State<CodeInputWidget> {
  late TextEditingController smsController;
  late OTPTextEditController controller;
  late OTPInteractor otpInteractor;
  late FocusNode focusNode;
  late StreamController<ErrorAnimationType> errorAnimationController;
  bool errorTriggered = false;
  bool hasError = false;

  @override
  void initState() {
    hasError = widget.hasError;
    errorAnimationController = StreamController();
    smsController = TextEditingController();
    otpInteractor = OTPInteractor();
    focusNode = FocusNode();
    listenToOTPCode();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CodeInputWidget oldWidget) {
    if (widget.hasError && !errorTriggered) {
      errorAnimationController.add(ErrorAnimationType.shake);
      errorTriggered = true;
    }
    if (widget.hasError != hasError) {
      hasError = widget.hasError;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: ((value) {
              setState(() {});
            }),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10000),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: _getBorderColor(context),
                  ),
                ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  autoFocus: true,
                  onChanged: (String value) {
                    hasError=false;
                    errorTriggered=false;
                    setState(() {});
                    widget.onChanged?.call(value);
                  },
                  onCompleted: (String value){
                    widget.onSubmitted.call(value);
                  },
                  errorAnimationController: errorAnimationController,
                  errorAnimationDuration: 500,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                 focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  errorTextSpace: 0,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    activeColor: Colors.transparent,
                    disabledColor: context.isDark ? Colors.white : Colors.black,
                    activeFillColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    errorBorderColor: Colors.transparent,
                    fieldOuterPadding: const EdgeInsets.all(0),
                    selectedFillColor: Colors.transparent,
                  ),
                  hintCharacter: '-',
                ),
              ),
            ),
          ),
          if (hasError && widget.errorText != null)
            Container(
              margin: const EdgeInsets.only(
                top: 4,
              ),
              child: TextWidget.regular(
                widget.errorText!,
                additionalStyle:  TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.error
                ),
                context: context,
              ),
            )
        ],
      ),
    );
  }

  void listenToOTPCode() async {
    if (Platform.isAndroid) {
      await otpInteractor.getAppSignature();
      controller = OTPTextEditController(
        codeLength: 4,
        onCodeReceive: (code) {
          smsController.text = code;
        },
        otpInteractor: otpInteractor,
      )..startListenUserConsent(
          (code) {
            final exp = RegExp(r'(\d{4})');
            return exp.stringMatch(code ?? '') ?? '';
          },
        );
    }
  }

  _getBorderColor(BuildContext context) {
    if (hasError) {
      return Theme.of(context).colorScheme.error;
    }
    if (focusNode.hasFocus) {
      return Theme.of(context).colorScheme.onSurfaceVariant;
    } else {
      return Colors.transparent;
    }
  }

  @override
  void dispose() async {
    focusNode.dispose();
    errorAnimationController.close();
    smsController.dispose();
    otpInteractor.stopListenForCode();
    controller.dispose();
    await controller.stopListen();
    super.dispose();
  }
}
