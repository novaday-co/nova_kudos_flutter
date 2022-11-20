import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';

String getFontFamily(BuildContext context) {
  if (Localizations.localeOf(context).languageCode == 'fa') {
    return Styles.persianFont;
  }
  return Styles.persianFont;
}