import 'package:flutter/material.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/features/play_music/widget/custom_another_song.dart';
import 'package:music_app/features/play_music/widget/custom_app_par.dart';
import 'package:music_app/features/play_music/widget/custom_play_controlar.dart';
import 'package:music_app/features/play_music/widget/custom_play_music_toole.dart';
import 'package:music_app/features/play_music/widget/custom_song_ditals.dart';

class PlayMusicScreen extends StatelessWidget {
  const PlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppPar(),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(AlignmentMengerX.x_020, AlignmentMengerY.y_0_98),
            end: Alignment(AlignmentMengerX.x_0_20, AlignmentMengerY.y_098),
            // ignore: deprecated_member_use
            colors: [Color(0xff411F5C), Color(0xff261F5C).withOpacity(0.85)],
          ),
        ),
        child: Column(
          children: [
            CustomSongDitals(),
            SizedBox(height: 10),
            CustomPlayControlar(
              value: 0.5,
              onChanged: (value) {},
              currentTime: "2:05",
              totalTime: "3:45",
            ),
            CustomPlayMusicToole(),
            CustomAnotherSong(),
          ],
        ),
      ),
    );
  }
}
