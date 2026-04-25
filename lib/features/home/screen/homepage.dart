import 'package:flutter/material.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/core/resource/route_manger.dart';
import 'package:music_app/features/home/widgets/coustom_text_field.dart';
import 'package:music_app/features/home/widgets/custom_music_card.dart';
import 'package:music_app/features/home/widgets/custom_tital.dart';
import 'package:music_app/features/home/widgets/custome_songes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(AlignmentMengerX.x_020, AlignmentMengerY.y_0_98),
              end: Alignment(AlignmentMengerX.x_0_20, AlignmentMengerY.y_098),
              // ignore: deprecated_member_use
              colors: [Color(0xff411F5C), Color(0xff261F5C).withOpacity(0.85)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36, left: 31, right: 31),
                  child: CoustomTextField(),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 31),
                  child: CustomTital(taxt: "Recently Played"),
                ),

                SizedBox(
                  height: 195,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 20),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 0),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, RoutesName.kPlayMusic);
                           }, 
                        child: MusicCard(
                          imagePath: 'lib/assets/images/tastImage.png',
                          songTitle: 'Who Says',
                          artistName: 'Selena Gomez',
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 31),
                  child: CustomTital(taxt: "Recommanded music"),
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 0),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.kPlayMusic);
                    }, 
                    child: CustomSongTile( 
                      imagePath: 'lib/assets/images/tastImage.png',
                      songTitle: 'Magenta Riddim',
                      artistName: 'DJ Snake',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}