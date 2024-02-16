import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeData? _customTheme;

  ThemeMode get themeMode => _themeMode;
  ThemeData? get customTheme => _customTheme;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setCustomTheme(ThemeData theme) {
    _customTheme = theme;
    notifyListeners();
  }
}
