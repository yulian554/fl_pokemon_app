import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {

  MainProvider() {
    _initialThemeColor();
  }

  Brightness _themeMode = Brightness.dark;
  bool get isDarkMode => _themeMode == Brightness.dark;

  ThemeData? theme;

  void changeThemeMode({required Brightness brightness}) {
    _themeMode = brightness;
    notifyListeners();
  }

  void _initialThemeColor() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
        colorSchemeSeed: Colors.red,
        brightness: _themeMode,
      );
    notifyListeners();
  }

  void changeThemeColor({required Color color}) {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
        colorSchemeSeed: color,
        brightness: _themeMode,
      );
    notifyListeners();
  }
}
