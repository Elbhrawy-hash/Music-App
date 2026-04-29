import 'package:flutter/material.dart';
import 'package:music_app/features/home/screen/homepage.dart';

class HomeController {
  static const List<Icon> naveBareIcons = [
    Icon(Icons.align_horizontal_left_sharp),
    Icon(Icons.home),
    Icon(Icons.favorite),
    Icon(Icons.list),
    Icon(Icons.settings),
  ];

  static const List<Widget> homescrenns = [
    Scaffold(
      body: Center(
        child: Text(
          "align_horizontal_left_sharp",
        ),
      ),
    ),

    Homepage(),

    Scaffold(
      body: Center(
        child: Text(
          "favorite",
        ),
      ),
    ),

    Scaffold(
      body: Center(
        child: Text(
          "list",
        ),
      ),
    ),

    Scaffold(
      body: Center(
        child: Text(
          "settings",
        ),
      ),
    ),
  ];
}