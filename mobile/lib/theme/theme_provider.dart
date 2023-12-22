import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  ThemeProvider({bool isDarkMode = false}) : _isDarkMode = isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    debugPrint('isDarkMode $_isDarkMode');
    notifyListeners();
  }
}
