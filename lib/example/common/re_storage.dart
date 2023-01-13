import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxze_re_flutter/example/common/constant.dart';

class ReStorage {
  static late SharedPreferences sp;

  /// 系统主题
  static ThemeMode get themeMode {
    final theme = sp.getString(StorageKey.themeMode);
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  static set themeMode(ThemeMode mode) {
    String themeString;
    switch (mode) {
      case ThemeMode.dark:
        themeString = 'Dark';
        break;
      case ThemeMode.light:
        themeString = 'Light';
        break;
      default:
        themeString = 'System';
    }
    sp.setString(StorageKey.themeMode, themeString);
  }
}
