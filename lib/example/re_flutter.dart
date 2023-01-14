import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxze_re_flutter/example/common/config_providers.dart';
import 'package:taxze_re_flutter/example/course/re_course_page.dart';
import 'package:taxze_re_flutter/example/modules/home/splash_page.dart';
import 'package:taxze_re_flutter/example/res/locale/re_localizations.dart';
import 'package:taxze_re_flutter/example/res/locale/re_localizations_delegate.dart';
import 'package:taxze_re_flutter/example/res/re_theme.dart';
import 'package:taxze_re_flutter/example/routers/re_router.dart';
import 'package:taxze_re_flutter/example/utils/screen_untils.dart';

/// create by Taxze on 2023/1/13
/// contact me by email 1929509811@qq.com
/// 说明: 主程序

class ReFlutter extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const ReFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget app = _configApp();

    /// 配置 provider
    app = ProviderScope(child: app);
    return app;
  }

  Widget _configApp() {
    return Consumer(builder: (context, ref, _) {
      final loading = ref.watch(ConfigProviders.configInit);
      return loading.map(data: (data) {
        print("data:${data}");
        return _configScreen();
      }, error: (_) {
        print("error:$_");
        return _configScreen();
      }, loading: (_) {
        print("loading:$_}");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            ScreenUtils.config(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: ScreenUtils.scale,
                boldText: false,
                platformBrightness: Brightness.light,
              ),
              child: child!,
            );
          },
          localizationsDelegates: [
            ReLocalizationsDelegate.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('zh', 'CN'),
          ],
          home: SplashPage(),
        );
      });
    });
  }

  Widget _configScreen() {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          ThemeMode themeMode = ref.watch(ConfigProviders.themeMode);
          print("===========$themeMode");
          Widget content = MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            onGenerateRoute: ReRouters.generateRoute,
            localizationsDelegates: [
              ReLocalizationsDelegate.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('zh', 'CN'),
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              print('deviceLocale:${locale}');
              print('languageCode:${locale?.languageCode}');
              print('countryCode:${locale?.countryCode}');
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: AppTheme.getTheme(),
            themeMode: themeMode,
            darkTheme: AppTheme.getTheme(isDarkMode: false),
            builder: (context, child) {
              ScreenUtils.config(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: ScreenUtils.scale,
                  boldText: false,
                  platformBrightness: Brightness.light,
                ),
                child: child!,
              );
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (context) {
                return Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                );
              });
            },
            home: child,
          );

          return Listener(
            behavior: HitTestBehavior.deferToChild,
            onPointerDown: (_) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: content,
          );
        },
        child: ReCoursePage(),
      ),
    );
  }

  Widget _configHome() {
    return Consumer(
      builder: (context, ref, _) {
        //预留迭代位置，用于判断是否进入登录页例如获取一些用户信息
        return SplashPage();
      },
    );
  }
}
