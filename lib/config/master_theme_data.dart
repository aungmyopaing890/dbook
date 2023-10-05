import 'package:flutter/material.dart';
import '../core/constant/dimesions.dart';
import 'master_colors.dart';
import 'master_config.dart';

ThemeData themeData(ThemeData baseTheme) {
  return baseTheme.copyWith(
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family),
        displayMedium: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family),
        displaySmall: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family),
        headlineMedium: TextStyle(
          color: MasterColors.black,
          fontFamily: MasterConfig.default_font_family,
        ),
        headlineSmall: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family,
            fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: MasterColors.black,
            fontWeight: FontWeight.normal,
            fontFamily: MasterConfig.default_font_family),
        titleMedium: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          color: MasterColors.black,
          fontFamily: MasterConfig.default_font_family,
        ),
        bodyMedium: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family,
            fontWeight: FontWeight.bold),
        labelLarge: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family),
        bodySmall: TextStyle(
            color: MasterColors.black,
            fontFamily: MasterConfig.default_font_family),
        labelSmall: TextStyle(
            fontSize: Dimesion.font12,
            fontWeight: FontWeight.w700,
            color: MasterColors.black),
      ),
      iconTheme: IconThemeData(color: MasterColors.primaryDarkWhite));
}
