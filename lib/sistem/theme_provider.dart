import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomThemeProvider extends ChangeNotifier {
  CustomThemeMode _themeMode = CustomThemeMode.red;

  CustomThemeMode get themeMode => _themeMode;

  CustomThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('themeMode');
    if (themeString != null) {
      _themeMode = CustomThemeModeExtension.fromString(themeString);
    }
    notifyListeners();
  }

  void setTheme(CustomThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeMode = mode;
    prefs.setString('themeMode', mode.asString());
    notifyListeners();
  }
}

enum CustomThemeMode { red, green, blue }

extension CustomThemeModeExtension on CustomThemeMode {
  static CustomThemeMode fromString(String themeString) {
    switch (themeString) {
      case 'CustomThemeMode.red':
        return CustomThemeMode.red;
      case 'CustomThemeMode.green':
        return CustomThemeMode.green;
      case 'CustomThemeMode.blue':
        return CustomThemeMode.blue;
      default:
        return CustomThemeMode.red;
    }
  }

  String asString() {
    switch (this) {
      case CustomThemeMode.red:
        return 'CustomThemeMode.red';
      case CustomThemeMode.green:
        return 'CustomThemeMode.green';
      case CustomThemeMode.blue:
        return 'CustomThemeMode.blue';
    }
  }
}
