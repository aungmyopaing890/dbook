import 'package:flutter/material.dart';

class MasterColors {
  MasterColors._();

  /// Primary Dark Color
  static Color primaryDarkDark = const Color(0xFF303030);
  static Color primaryDarkAccent = const Color(0x1FFFFFFF);
  static Color primaryDarkWhite = const Color(0xFFffffff);
  static Color primaryDarkGrey = const Color(0xFFA0A0A0);
  static Color darkGrey = const Color(0xFF9F9F9F);

  // /// Secondary Color
  static Color secondary50 = const Color(0xFFF9F9F9);
  static Color secondary100 = const Color(0xFFF3F3F3);
  static Color secondary200 = const Color(0xFFEAEAEA);
  static Color secondary300 = const Color(0xFFDADADA);
  static Color secondary400 = const Color(0xFFB7B7B7);
  static Color secondary500 = const Color(0xFF979797);
  static Color secondary600 = const Color(0xFF6F6F6F);
  static Color secondary700 = const Color(0xFF5B5B5B);
  static Color secondary800 = const Color(0xFF3C3C3C);
  static Color secondary900 = const Color(0xFF1C1C1C);

  ///
  /// text Color
  ///
  static Color? textColor1 = secondary900;
  static Color? textColor2 = mainColor;
  static Color? textColor3 = secondary50;
  static Color? appBarTitleColor = black;

  ///
  /// Button Color
  ///
  static Color? buttonColor = black;
  // static Color? successColor;

  ///
  /// Primary Color
  ///
  static Color mainColor = const Color(0xFFDEA34B);

  //Back ground Color
  static Color appBackgorundColor = white;
  static Color appBarBackgorundColor = mainColor;

  ///
  /// Icon Color
  ///
  static Color iconColor = black;
  static Color iconRejectColor = red;
  static Color iconSuccessColor = const Color(0x1FFFFFFF);
  static Color iconInfoColor = const Color(0x1FFFFFFF);

  //Status color
  static Color successColor = const Color(0xFF33B712);
  static Color rejectColor = red;
  static Color warningColor = const Color(0xFFFFC700);

  ///
  /// General
  ///
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color grey = const Color(0xFFF4F4F4);
  static Color transparent = Colors.transparent;
  static Color shadow = const Color(0xFF2598D7);
  static Color red = Colors.red;

  //Card Colors
  static Color cardBackgroundColor = const Color(0xFFEDF0F4);
  static Color cardBorderColor = const Color(0xFFF7F5F2);
}
