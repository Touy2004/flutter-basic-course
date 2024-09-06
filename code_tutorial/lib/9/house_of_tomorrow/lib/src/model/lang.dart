import 'package:code_tutoorial/9/house_of_tomorrow/lib/util/helper/intl_helper.dart';

class Lang {
  final String la;
  final String en;

  const Lang({
    required this.la,
    required this.en,
  });

  factory Lang.fromJson(Map<String, dynamic> json) {
    return Lang(
      la: json['ko'] ?? '',
      en: json['en'] ?? '',
    );
  }

  @override
  String toString() => IntlHelper.isLa ? la : en;
}
