import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moviedb/helpers/common.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moviedb/theme/theme_provider.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/helpers/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward().then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        navigateHome(context);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode == false ? primaryColor : lightBlackColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: _animation.value,
                    child: Image.asset(
                      AppConstants.logoImage,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Opacity(
                    opacity: _animation.value,
                    child: Text(
                      'MovieDB',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.isDarkMode == false
                              ? whiteColor
                              : accentColor),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Opacity(
                    opacity: _animation.value,
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(
                          fontSize: 14,
                          color: themeProvider.isDarkMode == false
                              ? whiteColor
                              : accentColor),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SpinKitFadingCircle(
                    color: secondaryColor,
                    size: 48.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: _animation.value,
                child: Text(
                  'All Rights Reserved © MovieDB.',
                  style: TextStyle(
                      fontSize: 14,
                      color: themeProvider.isDarkMode == false
                          ? whiteColor
                          : accentColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
