import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxze_re_flutter/example/common/re_app_state.dart';
import 'package:taxze_re_flutter/example/common/re_storage.dart';

class ConfigProviders {
  static final configInit = FutureProvider.autoDispose<void>((ref) async {
    await Future.wait([
      SharedPreferences.getInstance(),
    ]).then((value) => ReStorage.sp = value[0]);
  });

  static final config =
      StateNotifierProvider<AppConfigStateNotifier, AppConfigState>((ref) {
    return AppConfigStateNotifier(
      AppConfigState(
        themeMode: ReStorage.themeMode,
      ),
    );
  });

  static final themeMode = Provider<ThemeMode>((ref) {
    return ref.watch(config).themeMode;
  });
}

class AppConfigStateNotifier extends StateNotifier<AppConfigState> {
  AppConfigStateNotifier(AppConfigState config) : super(config);

  /// 修改主题模式
  void changeDarkMode(ThemeMode mode) {
    ReStorage.themeMode = mode;
    state = state.copyWith(themeMode: mode);
  }
}
