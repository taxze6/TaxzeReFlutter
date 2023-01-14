import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/res/locale/re_localizations.dart';
import 'package:taxze_re_flutter/example/res/re_colors.dart';
import 'package:taxze_re_flutter/example/res/text_styles.dart';
import 'package:taxze_re_flutter/example/utils/image_utils.dart';
import 'package:taxze_re_flutter/example/utils/screen_untils.dart';
import 'package:taxze_re_flutter/example/widget/load_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ReColors.appMainBackGrayColor,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 108.fit,
                width: 108.fit,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ReColors.appMainBackWhiteColor),
                child: LoadAssetImage(
                  'logo',
                  format: ImageFormat.jpg,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ReLocalizations.of(context).splash,
                  style: TextStyles.textBold16,
                ),
              ),
            ],
          ),
        ));
  }

// Widget _configHome() {
//   return Consumer(
//     builder: (context, ref, _) {
//       //预留迭代位置，用于判断是否进入登录页例如获取一些用户信息
//       return Container();
//     },
//   );
// }
}
