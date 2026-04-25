import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomAppPar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppPar({super.key});
  @override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Now playing",
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontManger.fontOrbitron,
            fontSize: 18,
            fontWeight:FontWeight.w500,


          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 18,

        ),
        actions: [
          Icon(Icons.share,color:Colors.white ,size: 18,),
          SizedBox(width: 15,),
          Icon(Icons.more_vert,color:Colors.white ,size: 18,),
          SizedBox(width: 13,),
        ],
      );
  }
}


