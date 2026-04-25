import 'package:flutter/material.dart';
import 'package:music_app/features/home/screen/home_screen.dart';
import 'package:music_app/features/onbording/screen/on_bording_screen.dart';
import 'package:music_app/features/play_music/screen/play_music.dart';
import 'package:music_app/features/splash/screens/splash_screen.dart';

class RouteManager{
  static Map<String, WidgetBuilder> routes = {
    RoutesName.ksplashScreen: (context) => const SplashScreen(),
    RoutesName.kOnBordingScreen: (context)=> const OnBordingScreen(),
    RoutesName.kHomeScreen:(context)=>const HomeScreen(),
    RoutesName.kPlayMusic:(context)=>const PlayMusicScreen(),
   

  };

}

class RoutesName{
  static const String ksplashScreen = '/splashScreen';
  static const String kOnBordingScreen = '/OnBordingScreen';
   static const String kHomeScreen = '/HomeScreen';

static const String kPlayMusic = '/playMusicScreen';
  

}

