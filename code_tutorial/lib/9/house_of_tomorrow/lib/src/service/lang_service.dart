import 'dart:developer';

import 'package:code_tutoorial/9/house_of_tomorrow/lib/util/helper/intl_helper.dart';
import 'package:flutter/material.dart';

class LangService with ChangeNotifier {
  LangService({
    Locale? locale,
  }) : locale = locale ?? IntlHelper.en;

  /// 현재 언어
  Locale locale;

  /// 언어 변경
  void toggleLang() {
    locale = IntlHelper.isLa ? IntlHelper.en : IntlHelper.lo;

    notifyListeners();
    log(locale.toString());
    log(const Locale('la').languageCode.toString());
  }
}
