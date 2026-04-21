import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomTital extends StatelessWidget {
  const CustomTital({super.key , required this.taxt});
  final String taxt;

  @override
  Widget build(BuildContext context) {
    return  Align(
  alignment: Alignment.centerLeft,
  child: Text(
    taxt,
    style: TextStyle(
      color: Colors.white,
      fontFamily: FontManger.fontOrbitron,
      fontSize: 18,
      fontWeight: FontWeight.w600
    ),
  ),
);
  }
}