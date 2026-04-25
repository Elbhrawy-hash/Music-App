import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomSongDitals extends StatelessWidget {
  const CustomSongDitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Padding(
            padding: const EdgeInsets.only(top: 100,bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image(image: AssetImage("lib/assets/images/tastImage.png"),
              fit: BoxFit.cover,
              width: 241,
              height: 207,),
            ),
          ),
          
          Text("NEW RULES",style: TextStyle(
            color: Colors.white,
            fontFamily: FontManger.fontOrbitron,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 4,),
           Text("Dua Lipa",style: TextStyle(
            color: Color(0xffB1AFE9),
            fontFamily: FontManger.fontOrbitron,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),)
          ],
        );
  }
}