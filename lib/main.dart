import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/My_Theme_Data.dart';
import 'package:to_do_app/Ui/Home/HomeScrean.dart';

import 'Provider/AppConfigProvider.dart';
import 'Ui/Home/List_Tap/Edit_List_Widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    intSharedPreference();
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
        Edit_List_Widget.routeName: (context) => Edit_List_Widget(),
      },
      initialRoute: HomeScrean.routeName,
    );
  }

  void intSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    provider.changeLanguage(prefs.getString('language') ?? "en");
    if (prefs.getString('theme') == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
