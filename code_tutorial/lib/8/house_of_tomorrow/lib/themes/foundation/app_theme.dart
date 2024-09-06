import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/res/typo.dart';
import 'package:flutter/material.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypo typo;
}
