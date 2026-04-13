import 'package:flutter/material.dart';
import 'package:music_app/core/resource/route_manger.dart';
import 'package:music_app/core/resource/time_manger.dart';

class SplashController {
  static void navigetorToOnbordingScreen(BuildContext context){
    Future.delayed(Duration(seconds:  TimeMangerSconed.s3),(){
     Navigator.pushReplacementNamed(context, RoutesName.kOnBordingScreen);
    });

  }
}