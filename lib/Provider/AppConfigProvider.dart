import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) {
    if (newMode == appTheme) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  void changeLanguage(String langcode) {
    if (langcode == appLanguage) {
      return;
    }
    appLanguage = langcode;
    notifyListeners();
  }
}
