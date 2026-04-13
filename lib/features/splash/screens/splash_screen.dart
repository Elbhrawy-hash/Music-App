import 'package:flutter/material.dart';
import 'package:music_app/features/splash/widgets/logo_splas.dart';
import 'package:music_app/controller/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
   SplashController.navigetorToOnbordingScreen(context);
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoSplas()
    );
  }
}