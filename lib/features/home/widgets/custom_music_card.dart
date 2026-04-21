// lib/features/home/widgets/music_card.dart

import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final String imagePath;
  final String songTitle;
  final String artistName;

  const MusicCard({
    super.key,
    required this.imagePath,
    required this.songTitle,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 121,
              height: 121,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Color(0xff9B6FD4),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}