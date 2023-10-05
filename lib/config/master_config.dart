// ignore_for_file: constant_identifier_names

class MasterConfig {
  MasterConfig._();

  ///
  /// AppVersion
  /// For AppName

  static const String app_name = 'DBook';

  ///
  /// AppVersion

  static const String app_version = '1.0';

  ///
  /// Database Name

  static const String app_db_name = 'dbook.db';

  ///
  /// API URL
  /// Change your backend url
  ///
  static const String core_url = 'https://saytaughtmal.lmsmm.com';

  static const String app_url = '$core_url/api/';

  ///
  /// Animation Duration
  ///
  static const Duration animation_duration = Duration(milliseconds: 500);

  static const String default_font_family = 'Kanit';
}
