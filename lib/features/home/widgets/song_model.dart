class SongModel {
  final String imagePath;
  final String songTitle;
  final String artistName;
  final String audioPath; // ← جديد

  const SongModel({
    required this.imagePath,
    required this.songTitle,
    required this.artistName,
    required this.audioPath, // ← جديد
  });
}