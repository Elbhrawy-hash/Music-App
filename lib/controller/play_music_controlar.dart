import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/core/resource/constans_value.dart';

class PlayMusicControlar {
  late int index;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;

  late StreamController<bool> playStutusControlar;
  late Sink<bool> playStutusInputData;
  late Stream<bool> playStutusOutputData;

  late StreamController<String> currentTimeControlar;
  late Sink<String> currentTimeInputData;
  late Stream<String> currentTimeOutputData;

  late StreamController<double> sliderControlar;
  late Stream<double> sliderOutputStream;

  late StreamController<bool> shuffleControlar;
  late Stream<bool> shuffleOutputStream;

  late StreamController<bool> repeatControlar;
  late Stream<bool> repeatOutputStream;

  Timer? _timer;
  bool isplay = true;
  bool isShuffle = false;
  bool isRepeat = false;
  Duration? audoiTime;
  List<int> _shuffleHistory = [];

  PlayMusicControlar._intiernal(this.index) {
    audioCache = AudioCache(prefix: "");
    audioPlayer = AudioPlayer();

    playStutusControlar = StreamController.broadcast();
    playStutusInputData = playStutusControlar.sink;
    playStutusOutputData = playStutusControlar.stream;

    currentTimeControlar = StreamController.broadcast();
    currentTimeInputData = currentTimeControlar.sink;
    currentTimeOutputData = currentTimeControlar.stream;

    sliderControlar = StreamController.broadcast();
    sliderOutputStream = sliderControlar.stream;

    shuffleControlar = StreamController.broadcast();
    shuffleOutputStream = shuffleControlar.stream;

    repeatControlar = StreamController.broadcast();
    repeatOutputStream = repeatControlar.stream;

    audioPlayer.onPlayerComplete.listen((_) {
      if (isRepeat) {
        play();
      } else {
        skipNext();
      }
    });
  }

  static PlayMusicControlar? instance;

  factory PlayMusicControlar(int index) {
    if (instance != null && instance!.index != index) {
      instance!.dispose();
      instance = null;
    }
    instance ??= PlayMusicControlar._intiernal(index);
    return instance!;
  }

  Future<Duration?> play() async {
    isplay = true;
    playStutusInputData.add(isplay);

    Uri uri = await audioCache.load(ConstansValue.listOfQuran[index].audioPath);
    await audioPlayer.play(UrlSource(uri.toString()));
    audoiTime = await audioPlayer.getDuration();

    _startTimer();
    return audoiTime;
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) async {
      final position = await audioPlayer.getCurrentPosition();
      currentTimeInputData.add(trnsfirToMintesAndScond(position));

      if (audoiTime != null && audoiTime!.inSeconds > 0) {
        final progress = (position?.inSeconds ?? 0) / audoiTime!.inSeconds;
        sliderControlar.sink.add(progress.clamp(0.0, 1.0));
      }
    });
  }

  void stop() {
    if (audioPlayer.state == PlayerState.playing) {
      audioPlayer.pause();
      isplay = false;
      _timer?.cancel();
    } else if (audioPlayer.state == PlayerState.paused) {
      audioPlayer.resume();
      isplay = true;
      _startTimer();
    }
    playStutusInputData.add(isplay);
  }

  void skipNext() {
    _timer?.cancel();
    audioPlayer.stop();

    if (isShuffle) {
      index = _getRandomIndex();
    } else {
      index = (index + 1) % ConstansValue.listOfQuran.length;
    }

    instance = PlayMusicControlar._intiernal(index);
    instance!.isShuffle = isShuffle;
    instance!.isRepeat = isRepeat;
    play();
  }

  void skipBack() {
    _timer?.cancel();
    audioPlayer.stop();

    if (_shuffleHistory.isNotEmpty) {
      index = _shuffleHistory.removeLast();
    } else {
      index = (index - 1 + ConstansValue.listOfQuran.length) %
          ConstansValue.listOfQuran.length;
    }

    instance = PlayMusicControlar._intiernal(index);
    instance!.isShuffle = isShuffle;
    instance!.isRepeat = isRepeat;
    play();
  }

  void toggleShuffle() {
    isShuffle = !isShuffle;
    shuffleControlar.sink.add(isShuffle);
  }

  void toggleRepeat() {
    isRepeat = !isRepeat;
    repeatControlar.sink.add(isRepeat);
  }

  int _getRandomIndex() {
    _shuffleHistory.add(index);
    int newIndex;
    do {
      newIndex = Random().nextInt(ConstansValue.listOfQuran.length);
    } while (newIndex == index && ConstansValue.listOfQuran.length > 1);
    return newIndex;
  }

  Future<void> seekTo(double value) async {
    if (audoiTime != null) {
      final newPosition = Duration(
        seconds: (value * audoiTime!.inSeconds).toInt(),
      );
      await audioPlayer.seek(newPosition);
      sliderControlar.sink.add(value);
    }
  }

  void dispose() {
    _timer?.cancel();
    audioPlayer.dispose();
    playStutusControlar.close();
    currentTimeControlar.close();
    sliderControlar.close();
    shuffleControlar.close();
    repeatControlar.close();
  }

  String trnsfirToMintesAndScond(Duration? duration) {
    if (duration == null) return "0:00";
    String mint = duration.inMinutes.remainder(60).toString().padLeft(2, "0");
    String scond = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return '$mint:$scond';
  }
}