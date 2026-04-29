import 'package:flutter/material.dart';

class CustomPlayMusicToole extends StatelessWidget {
  const CustomPlayMusicToole({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(vertical:4, horizontal: 30),
      decoration: BoxDecoration(
        color: Color(0xff6A4C93).withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToolItem(Icons.favorite_border, "Like"),
          _buildToolItem(Icons.playlist_add, "Playlist"),
          _buildToolItem(Icons.download_outlined, "Download"),
          _buildToolItem(Icons.more_vert, "More"),
        ],
      ),
    );
  }

  Widget _buildToolItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}