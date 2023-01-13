import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppConfigState extends Equatable{
  final ThemeMode themeMode;

  /// 调试相关
  const AppConfigState({
    required this.themeMode,
  });

  AppConfigState copyWith({
    bool? hadShowGuide,
    ThemeMode? themeMode,
  }) {
    return AppConfigState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  List<Object?> get props => [themeMode];

  @override
  String toString() {
    return 'AppState{themeMode: $themeMode}';
  }
}
