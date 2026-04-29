import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomAnotherSong extends StatelessWidget {
  final String imagePath;
  final String songTitle;
  final String artistName;
  final VoidCallback? onSkip; // ← زر الـ skip

  const CustomAnotherSong({
    super.key,
    required this.imagePath,
    required this.songTitle,
    required this.artistName,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362,
      height: 97,
      margin: const EdgeInsets.only(top: 6, left: 30, right: 30),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: const Color(0xffB1AFE9).withOpacity(0.50),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Up Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontManger.fontOrbitron,
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  width: 52,
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xff8A86F4),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, top: 2),
                    child: Text(
                      "Queue >",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontManger.fontOrbitron,
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Track Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        width: 40,
                        height: 40,
                        image: AssetImage(imagePath), // ← من الـ parameter
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songTitle, // ← من الـ parameter
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontManger.fontOrbitron,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 0),
                      Text(
                        artistName, // ← من الـ parameter
                        style: TextStyle(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.65),
                          fontFamily: FontManger.fontOrbitron,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Skip Button
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: onSkip, 
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}