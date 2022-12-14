import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/colors/colors.dart';

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: PrimaryColor.light,
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: BackgroundColor.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: BackgroundColor.light,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: BackgroundColor.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: BackgroundColor.light,
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: PrimaryColor.light,
      background: BackgroundColor.light,
      tertiary: TextPrimaryColor.light,
      onTertiary: TextSubtitleColor.light,
      tertiaryContainer: DisabledTextColor.light,
      surfaceTint: DisabledColor.light,
      outline: BorderColor.light,
      surface: YellowColor.light,
      onSurface: BlueColor.light,
      surfaceVariant: GreenColor.light,
    ),
  );
}