import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/lang_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/tile.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/util/helper/intl_helper.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = context.theme.brightness == Brightness.light;
    final LangService langService = context.watch();
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Theme Tile
          Tile(
            icon: isLightTheme ? 'sunny' : 'moon',
            title: S.current.theme,
            subtitle: isLightTheme ? S.current.light : S.current.dark,
            onPressed: context.read<ThemeService>().toggleTheme,
          ),

          /// Lang Tile
          Tile(
            icon: 'language',
            title: S.current.language,
            subtitle: IntlHelper.isLa ? S.current.lo : S.current.en,
            onPressed: langService.toggleLang,
          ),
        ],
      ),
    );
  }
}
