import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxze_re_flutter/example/common/config_providers.dart';
import 'package:taxze_re_flutter/example/modules/home/splash_page.dart';
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
      return loading.map(data: (_) {
        return _configScreen();
      }, error: (_) {
        return _configScreen();
      }, loading: (_) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
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

        Widget content = MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: ReRouters.generateRoute,
          supportedLocales: const [
            Locale('zh', 'CN'),
          ],
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
      child: _configHome(),
    ));
  }

  Widget _configHome() {
    return Consumer(
      builder: (context, ref, _) {
        //预留迭代位置，例如获取一些用户信息
        return Scaffold();
      },
    );
  }
}
