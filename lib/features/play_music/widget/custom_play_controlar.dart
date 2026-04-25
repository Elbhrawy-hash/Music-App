import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CustomPlayControlar extends StatelessWidget {
  const CustomPlayControlar({
    super.key,
    required this.onChanged,
    required this.value,
    this.currentTime = "0:00",
    this.totalTime = "0:00",
  });

  final ValueChanged<double> onChanged;
  final double value;
  final String currentTime;
  final String totalTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                width: 24,
                height: 24,
                image: AssetImage("lib/assets/images/icon/🦆 icon _shuffle_.png"),
              ),
              Container(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffB1AFE9),
                ),
                child: Image(
                  width: 45,
                  height: 45,
                  image: AssetImage("lib/assets/images/icon/pause button.png"),
                ),
              ),
              Container(
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
              Image(
                width: 24,
                height: 24,
                image: AssetImage("lib/assets/images/icon/repeat.png"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        // Slider
        SizedBox(
          width: double.infinity,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xffB1AFE9),
              inactiveTrackColor: const Color(0xff2F5D9A),
              thumbColor: Colors.transparent,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 2),
              overlayColor: Colors.transparent,
              trackHeight: 10,
              trackShape: const RectangularSliderTrackShape(),
            ),
            child: Slider(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),

        // Timestamps
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, ), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentTime,
                style: const TextStyle(color: Colors.white70, fontSize: 12,fontFamily: FontManger.fontOrbitron,),
              ),
              Text(
                totalTime,
                style: const TextStyle(color: Colors.white70, fontSize: 12,  fontFamily: FontManger.fontOrbitron,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}