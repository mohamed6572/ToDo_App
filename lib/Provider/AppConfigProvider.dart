import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newMode == appTheme) return;
    prefs.setString('theme', newMode == ThemeMode.light ? 'light' : 'dark');
    appTheme = newMode;
    notifyListeners();
  }

  void changeLanguage(String langcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (langcode == appLanguage) return;
    prefs.setString('language', langcode);
    appLanguage = langcode;
    notifyListeners();
  }
}
