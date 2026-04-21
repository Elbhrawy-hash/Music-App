import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white, 
        fontFamily: FontManger.fontOrbitron,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: const Color(0xffB1AFE9),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.search, color: Colors.white),
        ),
        hintText: "Search Song", 
        hintStyle: const TextStyle(
          fontFamily: FontManger.fontOrbitron,
          color: Colors.white,
          fontSize: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
