import 'package:flutter/material.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/core/resource/color_manger.dart';
import 'package:music_app/core/resource/font_manger.dart';
import 'package:music_app/features/onbording/widgets/custoum_tital.dart';
import 'package:music_app/features/onbording/widgets/custum_button.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(AlignmentMengerX.x_020, AlignmentMengerY.y_0_98),
            end: Alignment(AlignmentMengerX.x_0_20, AlignmentMengerY.y_098),
            colors: [
              ColorManger.Kprimary_color,
              const Color.fromARGB(255, 39, 15, 222).withOpacity(0.54),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 70),
            CustomTitle(
              firstLine: "Find Your\n Favourite ",
              fontSize: SizeManger.s50,
              fontWeight: FontWeight.bold,
              firstLineColor: ColorManger.khite,
              h: 1,
            ),
            CustomTitle(
              firstLine: "Music ",
              fontSize: SizeManger.s50,
              fontWeight: FontWeight.bold,
              firstLineColor: ColorManger.ktital_color,
              h: 1,
            ),
            SizedBox(height: 15),
            CustomTitle(
              firstLine:
                  "Find Your Latest Favourite Music\nFrom Our Collection ",
              fontSize: SizeManger.s15,
              fontWeight: FontWeight.w500,
              firstLineColor: ColorManger.khite,
              h: 1.2,
            ),
            SizedBox(height: 25),
            CustumButton(),
            Expanded(
              child: Stack(
                children: [
                  
                  Image.asset(
                    "lib/assets/images/onBoardingImage.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 199,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorManger.ktital_color.withOpacity(0.04),
                            Color(0xff411F5C),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
