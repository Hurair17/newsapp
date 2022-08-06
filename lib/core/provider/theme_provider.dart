import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/services/dark_theme_prefrences.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreferences darkThemePreferences = ThemePreferences();
  bool darkTheme = false;
  bool get getDartTheme => darkTheme;

  set setDarkTheme(bool value) {
    darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
