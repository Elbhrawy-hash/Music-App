import 'package:flutter/material.dart';
import 'package:music_app/core/resource/route_manger.dart';
import 'package:music_app/core/resource/time_manger.dart';

class SplashController {
  static void navigetorToOnbordingScreen(BuildContext context){
    Future.delayed(Duration(seconds:  TimeMangerSconed.s3),(){
     // ignore: use_build_context_synchronously
     Navigator.pushReplacementNamed(context, RoutesName.kOnBordingScreen);
    });

  }
}