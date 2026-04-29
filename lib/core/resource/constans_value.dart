// lib/core/constants/constans_value.dart


import 'package:music_app/features/home/widgets/song_model.dart';

class ConstansValue {
  static List<SongModel> listOfQuran = [
    SongModel(
      imagePath: 'assets/images/qu1.jpg',
      songTitle: 'Algan',
      artistName: 'Yasser Al-Dosari',
      audioPath: 'assets/audio/Algan.mp3'
    ),
    SongModel(
      imagePath: 'assets/images/qu2.jpg',
      songTitle: 'Al-Kahf',
      artistName: 'Yasser Al-Dosari',
      audioPath: 'assets/audio/Al-khfe.mp3'
    ),
    SongModel(
      imagePath: 'assets/images/qu3.jpg',
      songTitle: 'Taha',
      artistName: 'Yasser Al-Dosari',
      audioPath: 'assets/audio/taha.mp3'
    ),
  ];
}