import 'package:flutter/material.dart';

class ReLocalizations {
  final Locale locale;

  ReLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "splash": "Hello, I am Taxze!",
      "series": "Series",
    },
    "zh": {
      "splash": "你好，我是Taxze!",
      "series": "系列",
    }
  };

  String get splash =>
      _localizedValues[locale.languageCode]?["splash"] ?? "splash";

  String get series =>
      _localizedValues[locale.languageCode]?["series"] ?? "series";

  static ReLocalizations of(BuildContext context) =>
      Localizations.of(context, ReLocalizations);
}
