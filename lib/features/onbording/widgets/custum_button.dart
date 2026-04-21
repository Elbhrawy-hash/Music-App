import 'package:flutter/material.dart';
import 'package:music_app/core/resource/color_manger.dart';
import 'package:music_app/core/resource/font_manger.dart';
import 'package:music_app/core/resource/route_manger.dart';

class CustumButton extends StatelessWidget {
  const CustumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){
      Navigator.pushNamed(context, RoutesName.kHomeScreen);
    },child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: ColorManger.khite)
                ),
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                begin: AlignmentGeometry.xy(0, -1),
                end: AlignmentGeometry.xy(0, 1)
              ,colors: [
                Color(0xff2F5D9A),
                Color(0xff80CFF2),
              ])),
              width: 171,
              height: 60,

              child: Center(child: Text("Get Start", style: TextStyle(
                color: ColorManger.khite,
                fontFamily: FontManger.fontOrbitron, 
                fontSize: 18,
              ),)),
            ),);
  }
}