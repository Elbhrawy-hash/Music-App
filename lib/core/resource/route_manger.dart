import 'package:flutter/material.dart';
import 'package:music_app/features/onbording/screen/on_bording_screen.dart';
import 'package:music_app/features/splash/screens/splash_screen.dart';

class RouteManager{
  static Map<String, WidgetBuilder> routes = {
    RoutesName.ksplashScreen: (context) => const SplashScreen(),
    RoutesName.kOnBordingScreen: (context)=> const OnBordingScreen(),
  };

}

class RoutesName{
  static const String ksplashScreen = '/splashScreen';
  static const String kOnBordingScreen = '/OnBordingScreen';
  

}

