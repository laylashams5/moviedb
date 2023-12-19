import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/helpers/slide_route.dart';
import 'package:moviedb/screens/home_screen.dart';
import 'package:moviedb/screens/splash_screen.dart';

navigateSplash(
  BuildContext context,
) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    ),
  );
}

navigateHome(
  BuildContext context,
) {
  Navigator.of(context).pushReplacement(
    SlideRoute(
      screen: const HomeScreen(),
      duration: const Duration(milliseconds: 500),
    ),
  );
}
