import 'package:flutter/material.dart';

import 're_colors.dart';

class TextStyles {
  static const TextStyle textSize12 = TextStyle(
    fontSize: 12,
  );
  static const TextStyle textSize16 = TextStyle(
    fontSize: 16,
  );
  static const TextStyle textBold14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: "Circular");
  static const TextStyle textBold16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Circular");
  static const TextStyle textBold18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Circular");
  static const TextStyle textBold24 =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: "Circular");
  static const TextStyle textBold26 =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold,fontFamily: "Circular");

  static const TextStyle textGray14 = TextStyle(
    fontSize: 14,
    color: ReColors.textGray,
  );
  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: 14,
    color: ReColors.darkTextGray,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle text = TextStyle(
    fontSize: 14,
    color: ReColors.text,
    // https://github.com/flutter/flutter/issues/40248
    textBaseline: TextBaseline.alphabetic,
  );
  static const TextStyle textDark = TextStyle(
    fontSize: 14,
    color: ReColors.darkText,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle textGray12 = TextStyle(
      fontSize: 12, color: ReColors.textGray, fontWeight: FontWeight.normal);
  static const TextStyle textDarkGray12 = TextStyle(
      fontSize: 12, color: ReColors.darkTextGray, fontWeight: FontWeight.normal);

  static const TextStyle textHint14 =
      TextStyle(fontSize: 14, color: ReColors.darkUnselectedItemColor);
}
