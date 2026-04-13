import 'package:flutter/material.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/core/resource/assets_manger.dart';
import 'package:music_app/core/resource/color_manger.dart';
import 'package:music_app/core/resource/heighet_manger.dart';
import 'package:music_app/core/resource/width_manger.dart';

class LogoSplas extends StatelessWidget {
  const LogoSplas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width:double.infinity,
        height: double.infinity,
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(AlignmentMengerX.x_020, AlignmentMengerY.y_0_98),
            end: Alignment(AlignmentMengerX.x_0_20, AlignmentMengerY.y_098),
            colors: [
              ColorManger.Kprimary_color,
              const Color.fromARGB(255, 44, 24, 194).withOpacity(0.54)
            ])
        ),
        child: Center( 
          child:Image.asset(AssetsManger.logo,width: WidthManger.w200,height: HeighetManger.h200,),
          )
        
      );
  }
}