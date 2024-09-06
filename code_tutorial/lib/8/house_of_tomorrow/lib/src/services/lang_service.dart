import 'package:code_tutoorial/utils/helper/intl_helper.dart';
import 'package:flutter/material.dart';

class LangService with ChangeNotifier {
  LangService({
    Locale? locale,
  }) : locale = locale ?? IntlHelper.en;

  /// 현재 언어
  Locale locale;

  /// 언어 변경
  void toggleLang() {
    locale = IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko;
    notifyListeners();
  }

  void toggleLo() {
    locale = IntlHelper.isLo ? IntlHelper.en : IntlHelper.lo;
    notifyListeners();
  }
}
