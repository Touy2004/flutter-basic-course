import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/cart_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/lang_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/utils/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeService(),
      ),
      ChangeNotifierProvider(
        create: (context) => LangService(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartService(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) => child!),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LangService>().locale,
      title: 'Flutter Demo',
      theme: context.themeService.themeData,
      initialRoute: RoutePath.shopping,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
