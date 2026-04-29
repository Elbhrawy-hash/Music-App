import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomTrackShape extends RectangularSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 10;
    final double trackLeft = offset.dx + 16;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 32;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomPlayControlar extends StatelessWidget {
  const CustomPlayControlar({
    super.key,
    required this.onChanged,
    required this.value,
    required this.onStop,
    required this.onNext,
    required this.onBack,
    required this.onShuffle,
    required this.onRepeat,
    required this.playStutusOutputData,
    required this.currentTimeStream,
    required this.sliderStream,
    required this.shuffleStream,
    required this.repeatStream,
    this.totalTime = "0:00",
  });

  final ValueChanged<double> onChanged;
  final double value;
  final Stream<String> currentTimeStream;
  final Stream<double> sliderStream;
  final Stream<bool> shuffleStream;
  final Stream<bool> repeatStream;
  final String totalTime;
  final Stream<bool> playStutusOutputData;
  final GestureTapCallback onStop;
  final GestureTapCallback onNext;
  final GestureTapCallback onBack;
  final GestureTapCallback onShuffle;
  final GestureTapCallback onRepeat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<bool>(
                stream: shuffleStream,
                initialData: false,
                builder: (context, snapshot) => GestureDetector(
                  onTap: onShuffle,
                  child: Image(
                    width: 24,
                    height: 24,
                    color: snapshot.data == true
                        ? Color(0xffB1AFE9)
                        : Colors.white,
                    image: AssetImage(
                      "lib/assets/images/icon/🦆 icon _shuffle_.png",
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onBack,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1, 0),
                      end: Alignment(0, -1),
                      colors: [Color(0xff854F9F), Color(0xffB1AFE9)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage("lib/assets/images/icon/back.png"),
                  ),
                ),
              ),
              InkWell(
                onTap: onStop,
                child: StreamBuilder<bool>(
                  stream: playStutusOutputData,
                  initialData: true,
                  builder: (context, snapshot) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffB1AFE9),
                    ),
                    child: snapshot.data == true
                        ? Image(
                            width: 45,
                            height: 45,
                            image: AssetImage(
                              "assets/images/icon/pause button.png",
                            ),
                          )
                        : Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onNext,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(-1, 0),
                      colors: [Color(0xff854F9F), Color(0xffB1AFE9)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage("lib/assets/images/icon/scip.png"),
                  ),
                ),
              ),
              StreamBuilder<bool>(
                stream: repeatStream,
                initialData: false,
                builder: (context, snapshot) => GestureDetector(
                  onTap: onRepeat,
                  child: Image(
                    width: 24,
                    height: 24,
                    color: snapshot.data == true
                        ? Color(0xffB1AFE9)
                        : Colors.white,
                    image: AssetImage("lib/assets/images/icon/repeat.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        StreamBuilder<double>(
          stream: sliderStream,
          initialData: 0.0,
          builder: (context, snapshot) => SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xffB1AFE9),
                inactiveTrackColor: const Color(0xff2F5D9A),
                thumbColor: Colors.transparent,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 2),
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 10,
                trackShape: CustomTrackShape(),
              ),
              child: Slider(
                value: snapshot.data!,
                onChanged: onChanged,
                activeColor: const Color(0xffB1AFE9),
                inactiveColor: const Color(0xff2F5D9A),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<String>(
                stream: currentTimeStream,
                initialData: "0:00",
                builder: (context, snapshot) => Text(
                  snapshot.data!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: FontManger.fontOrbitron,
                  ),
                ),
              ),
              Text(
                totalTime,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontFamily: FontManger.fontOrbitron,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}