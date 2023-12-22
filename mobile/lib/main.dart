import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviedb/helpers/shared_preferences.dart';
import 'package:moviedb/localization/app_localizations.dart';
import 'package:moviedb/localization/localization_provider.dart';
import 'package:moviedb/providers/movie_list_provider.dart';
import 'package:moviedb/screens/splash_screen.dart';
import 'package:moviedb/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  debugPaintSizeEnabled = false;

  final isDarkMode = SharedPreferencesHelper.getBool('isDarkMode') ?? false;

  final selectedLanguage =
      SharedPreferencesHelper.loadString('selectedLanguage') ?? 'en';
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MovieListProvider()),
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: isDarkMode)),
    ChangeNotifierProvider(
        create: (_) => LocalizationProvider(selectedLanguage)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    final locale = localizationProvider.locale;
    return MaterialApp(
      title: 'MovieDB',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: locale,
      supportedLocales: LocalizationProvider.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
