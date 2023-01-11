import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/strings.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_snackbars_widget.dart';

extension ContextExtensions on BuildContext {
  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool get isKeyboardUp {
    return EdgeInsets.fromWindowPadding(
                WidgetsBinding.instance.window.viewInsets,
                WidgetsBinding.instance.window.devicePixelRatio)
            .bottom >
        0;
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

  double heightPercentage(double percentage) {
    return MediaQuery.of(this).size.height * (percentage / 100);
  }

  double widthPercentage(double percentage) {
    return MediaQuery.of(this).size.width * (percentage / 100);
  }

  Size get widgetSize {
    return (findRenderObject() as RenderBox).size;
  }

  Color getColorByIndex(int index) {
    switch (index % 4) {
      case 0:
        return Theme.of(this).colorScheme.primary;
      case 1:
        return Theme.of(this).colorScheme.onSurface;
      case 2:
        return Theme.of(this).colorScheme.surfaceVariant;
      default:
        return Theme.of(this).colorScheme.surface;
    }
  }

  bool get isModalOpen{
    return ModalRoute.of(this)?.isCurrent != true;
  }

  void dismissModal(){
    if(isModalOpen){
      Navigator.pop(this);
    }
  }

  void showSuccessSnackBar(String title){
    KudosSnackBars.showSuccessSnackBar(this, title);
  }

  void showFailedSnackBar(String? title){
    KudosSnackBars.showFailedSnackBar(this, title);
  }
}
