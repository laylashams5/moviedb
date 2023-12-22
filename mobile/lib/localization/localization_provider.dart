import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', '');

  LocalizationProvider(String selectedLanguage) {
    _locale = Locale(selectedLanguage, '');
  }

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  static LocalizationProvider of(BuildContext context) {
    return Provider.of<LocalizationProvider>(context, listen: false);
  }

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
    Locale('zh', 'CN'),
  ];
}
