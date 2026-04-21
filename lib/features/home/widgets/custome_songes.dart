// lib/features/home/widgets/custom_song_tile.dart

import 'package:flutter/material.dart';

class CustomSongTile extends StatefulWidget {
  final String imagePath;
  final String songTitle;
  final String artistName;

  const CustomSongTile({
    super.key,
    required this.imagePath,
    required this.songTitle,
    required this.artistName,
  });

  @override
  State<CustomSongTile> createState() => _CustomSongTileState();
}

class _CustomSongTileState extends State<CustomSongTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(widget.imagePath),
          ),

          const SizedBox(width: 16),

          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.songTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.artistName,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}