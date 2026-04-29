import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomSongDitals extends StatelessWidget {
  final String imagePath;  
  final String songTitle;  
  final String artistName; 

  const CustomSongDitals({
    super.key,
    required this.imagePath,
    required this.songTitle,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image(
              image: AssetImage(imagePath), // ← من الـ parameter
              fit: BoxFit.cover,
              width: 241,
              height: 207,
            ),
          ),
        ),

        Text(
          songTitle, // ← من الـ parameter
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontManger.fontOrbitron,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 4),

        Text(
          artistName, // ← من الـ parameter
          style: TextStyle(
            color: Color(0xffB1AFE9),
            fontFamily: FontManger.fontOrbitron,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}