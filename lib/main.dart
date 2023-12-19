import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviedb/helpers/shared_preferences.dart';
import 'package:moviedb/localization/localization_provider.dart';
import 'package:moviedb/screens/splash_screen.dart';
import 'package:moviedb/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  debugPaintSizeEnabled = false;

  final isDarkMode = SharedPreferencesHelper.getBool('isDarkMode') ?? false;

  final selectedLanguage =
      SharedPreferencesHelper.loadString('selectedLanguage') ?? 'en';
  runApp(MultiProvider(providers: [
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
    return const MaterialApp(
      title: 'MovieDB',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
