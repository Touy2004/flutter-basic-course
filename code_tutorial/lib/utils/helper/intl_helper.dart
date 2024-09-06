import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class IntlHelper {
  /// Supported Languages
  static const Locale en = Locale('en');
  static const Locale ko = Locale('ko');

  static const Locale lo = Locale('lo');


  ///Whether Korean or not
  static bool get isKo => Intl.getCurrentLocale() == ko.languageCode;
  static bool get isLo => Intl.getCurrentLocale() == lo.languageCode;

  /// call
  static String currency({
    required String symbol,
    required int number,
  }) {
    return NumberFormat.currency(
      symbol: symbol,
      locale: (symbol == '￦' ? ko : en).languageCode,
    ).format(number);
  }
}
