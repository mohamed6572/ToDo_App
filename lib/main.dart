import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/My_Theme_Data.dart';
import 'package:to_do_app/Ui/Home/HomeScrean.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Provider/AppConfigProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScrean.routeName: (context) => HomeScrean(),
      },
      initialRoute: HomeScrean.routeName,
    );
  }
}
