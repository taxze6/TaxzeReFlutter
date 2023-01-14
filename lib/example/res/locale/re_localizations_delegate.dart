import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxze_re_flutter/example/res/locale/re_localizations.dart';


class ReLocalizationsDelegate extends LocalizationsDelegate<ReLocalizations> {
  //是否在我们支持的语言范围
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  /*
  * 当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
    一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次Localizations重新build时都加载一遍；
    所以一般情况下返回false即可；
  * */
  @override
  bool shouldReload(LocalizationsDelegate<ReLocalizations> old) {
    return false;
  }

  /*
  * 当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
  这个方法返回的是一个Future，因为有可能是异步加载的；
  但是我们这里是直接定义的一个Map，因此可以直接返回一个同步的Future（SynchronousFuture）
  * */
  @override
  Future<ReLocalizations> load(Locale locale) {
    return SynchronousFuture(ReLocalizations(locale));
  }

  static ReLocalizationsDelegate delegate = ReLocalizationsDelegate();
}