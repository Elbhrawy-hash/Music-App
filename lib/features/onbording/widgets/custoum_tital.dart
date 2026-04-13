
import 'package:flutter/material.dart';
import 'package:music_app/core/resource/color_manger.dart';
import 'package:music_app/core/resource/font_manger.dart';


class CustomTitle extends StatelessWidget {
  final String firstLine;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? firstLineColor;
  final double?h;
  

  const CustomTitle({
    super.key,
    required this.firstLine,
    this.fontSize,
    this.fontWeight,
    this.firstLineColor,
    required this.h
    
  });

  @override
  Widget build(BuildContext context) {
    return Text(
          textAlign: TextAlign.center,
          firstLine,
          style: TextStyle(
            fontFamily: FontManger.fontOrbitron,
            fontSize: fontSize ?? SizeManger.s50,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: firstLineColor ?? ColorManger.khite,
            height: h,
          ),
        );
  }
}