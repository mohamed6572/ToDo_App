import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  bool isDone(bool isd) {
    if (isd == true) {
      return isd = true;
    }
    return isd = false;
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
