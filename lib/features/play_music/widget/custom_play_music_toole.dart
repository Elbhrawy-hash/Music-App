import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomPlayMusicToole extends StatelessWidget {
  const CustomPlayMusicToole({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: 252,
              height: 46,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Color(0xffB1AFE9).withOpacity(0.50),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 34,top: 5,bottom: 4,right: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.heart_broken_outlined, color: Colors.white),
                        Text(
                          "Like",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontManger.fontOrbitron,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.playlist_add, color: Colors.white),
                        Text(
                          "Playlist",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontManger.fontOrbitron,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.file_download, color: Colors.white),
                        Text(
                          "Dowenload",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontManger.fontOrbitron,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.more_vert, color: Colors.white),
                        Text(
                          "More",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontManger.fontOrbitron,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}