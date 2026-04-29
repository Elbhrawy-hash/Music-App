import 'package:flutter/material.dart';
import 'package:music_app/controller/play_music_controlar.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/core/resource/constans_value.dart';
import 'package:music_app/features/play_music/widget/custom_another_song.dart';
import 'package:music_app/features/play_music/widget/custom_app_par.dart';
import 'package:music_app/features/play_music/widget/custom_play_controlar.dart';
import 'package:music_app/features/play_music/widget/custom_play_music_toole.dart';
import 'package:music_app/features/play_music/widget/custom_song_ditals.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  late int index;
  late PlayMusicControlar _playMusicControlar;
  Future<Duration?>? _playFuture;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      index = (ModalRoute.of(context)!.settings.arguments as int?) ?? 0;
      _playMusicControlar = PlayMusicControlar(index);
      _playFuture = _playMusicControlar.play();

      _playMusicControlar.shuffleOutputStream.listen((_) {
        if (mounted) setState(() {
          index = _playMusicControlar.index;
        });
      });
    }
  }

  @override
  void dispose() {
    _playMusicControlar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final song = ConstansValue.listOfQuran[index];
    final nextIndex = (index + 1) % ConstansValue.listOfQuran.length;
    final nextSong = ConstansValue.listOfQuran[nextIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppPar(),
      body: FutureBuilder<Duration?>(
        future: _playFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(
                  AlignmentMengerX.x_020,
                  AlignmentMengerY.y_0_98,
                ),
                end: Alignment(
                  AlignmentMengerX.x_0_20,
                  AlignmentMengerY.y_098,
                ),
                colors: [
                  Color(0xff411F5C),
                  Color(0xff261F5C).withOpacity(0.85),
                ],
              ),
            ),
            child: Column(
              children: [
                CustomSongDitals(
                  imagePath: song.imagePath,
                  songTitle: song.songTitle,
                  artistName: song.artistName,
                ),
                SizedBox(height: 18),
                CustomPlayControlar(
                  value: 0.0,
                  onChanged: (value) => _playMusicControlar.seekTo(value),
                  currentTimeStream: _playMusicControlar.currentTimeOutputData,
                  sliderStream: _playMusicControlar.sliderOutputStream,
                  shuffleStream: _playMusicControlar.shuffleOutputStream,
                  repeatStream: _playMusicControlar.repeatOutputStream,
                  totalTime: _playMusicControlar.trnsfirToMintesAndScond(snapshot.data),
                  onStop: () => _playMusicControlar.stop(),
                  onNext: () {
                    _playMusicControlar.skipNext();
                    setState(() {
                      index = _playMusicControlar.index;
                    });
                  },
                  onBack: () {
                    _playMusicControlar.skipBack();
                    setState(() {
                      index = _playMusicControlar.index;
                    });
                  },
                  onShuffle: () => _playMusicControlar.toggleShuffle(),
                  onRepeat: () => _playMusicControlar.toggleRepeat(),
                  playStutusOutputData: _playMusicControlar.playStutusOutputData,
                ),
                SizedBox(height: 12),
                CustomPlayMusicToole(),
                SizedBox(height: 6),
                CustomAnotherSong(
                  imagePath: nextSong.imagePath,
                  songTitle: nextSong.songTitle,
                  artistName: nextSong.artistName,
                  onSkip: () {
                    _playMusicControlar.skipNext();
                    setState(() {
                      index = _playMusicControlar.index;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}