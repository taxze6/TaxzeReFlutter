import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxze_re_flutter/example/res/re_colors.dart';
import 'package:taxze_re_flutter/example/res/text_styles.dart';

class AppTheme {
  static ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      errorColor: isDarkMode ? ReColors.darkRed : ReColors.red,
      primaryColor: isDarkMode ? ReColors.darkAppMain : ReColors.appMain,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        secondary: isDarkMode ? ReColors.darkAppMain : ReColors.appMain,
      ),
      //指示器颜色
      indicatorColor: isDarkMode ? ReColors.darkAppMain : ReColors.appMain,
      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? ReColors.darkBgColor : Colors.white,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? ReColors.darkMaterialBg : Colors.blue,
      // 文字选择色
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ReColors.appMain.withAlpha(70),
        selectionHandleColor: ReColors.appMain,
        cursorColor: ReColors.appMain,
      ),
      textTheme: TextTheme(
        // TextField输入文字颜色
        subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
        subtitle2:
            isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        foregroundColor: isDarkMode ? Colors.blue : ReColors.text,
        backgroundColor: isDarkMode ? ReColors.darkBgColor : Colors.blue,
        shadowColor: isDarkMode ? Colors.transparent : Colors.black45,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: isDarkMode ? Colors.white : ReColors.text,
        ),
        toolbarHeight: 44,
        systemOverlayStyle:
            isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? ReColors.darkLine : ReColors.line,
        space: 0.6,
        thickness: 0.6,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      visualDensity: VisualDensity
          .standard, // https://github.com/flutter/flutter/issues/77142
    );
  }
}
