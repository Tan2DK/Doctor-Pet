import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'language/language.dart';
import 'utils/app_constant.dart';
import 'utils/app_routes.dart';

Future<void> runMyApp() async {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(.5)
    ..backgroundColor = Colors.black.withOpacity(.5)
    ..indicatorColor = Colors.white;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    GetMaterialApp(
      title: StringConstant.appName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(LocaleKey.vi, CountryKey.vn),
        Locale(LocaleKey.en, CountryKey.en),
      ],
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.home,
      getPages: AppRoutes.mainRoutes,
      theme: AppThemes.lightTheme,
      translations: Language(),
      builder: EasyLoading.init(),
    ),
  );
}
