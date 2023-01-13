import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxze_re_flutter/example/re_flutter.dart';

final mainAppProvider = StateProvider((ref) {
  return ReFlutter();
});

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //高帧率手机上，Flutter列表慢慢拖动的时候会感觉到明显的抖动现象，使用此方法可以有效解决
  GestureBinding.instance.resamplingEnabled = true;
  runApp(ProviderScope(child: Consumer(
    builder: (context, ref, _) {
      return ref.watch(mainAppProvider);
    },
  )));

  if (Platform.isAndroid) {
    //透明沉浸式状态栏
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));
  }
}
