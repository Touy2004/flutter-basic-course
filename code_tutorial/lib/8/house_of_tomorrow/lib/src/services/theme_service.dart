import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/dark_theme.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/foundation/app_theme.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({AppTheme? theme}) : theme = theme ?? LightTheme();
  AppTheme theme;

  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.typo.headline2.copyWith(
          color: theme.color.text,
        ),
      ),

      //BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        // constraints: BoxConstraints(
        //   maxWidth: Breakpoints.bottomSheet,
        // ),
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypo get typo => theme.typo;
}
