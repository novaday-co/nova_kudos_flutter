import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_gen/gen_l10n/strings.dart';

extension ContextExtensions on BuildContext {

  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool get isKeyboardUp {
    return EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio).bottom > 0;
  }

  bool get isRTL {
    return intl.Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode);
  }

  AppLocalizations get getStrings {
    return AppLocalizations.of(this)!;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }


}