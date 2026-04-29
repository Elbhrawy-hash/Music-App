import 'package:flutter/material.dart';
import 'package:music_app/core/resource/alignment_menger.dart';
import 'package:music_app/core/resource/constans_value.dart';
import 'package:music_app/core/resource/route_manger.dart';
import 'package:music_app/features/home/widgets/coustom_text_field.dart';
import 'package:music_app/features/home/widgets/custom_music_card.dart';
import 'package:music_app/features/home/widgets/custom_tital.dart';
import 'package:music_app/features/home/widgets/custome_songes.dart';
import 'package:music_app/features/home/widgets/song_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<SongModel> allSongs = ConstansValue.listOfQuran;

  List<SongModel> filteredSongs = [];

  bool isSearching = false;

  final TextEditingController searchController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSongs = allSongs;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchSong(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredSongs = allSongs;
        isSearching = false;
      });

      return;
    }

    final results = allSongs.where((song) {
      final title = song.songTitle.toLowerCase();
      final artist = song.artistName.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input) || artist.contains(input);
    }).toList();

    setState(() {
      filteredSongs = results;
      isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: const Color(0xff261F5C),

        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,

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
                  const Color(0xff411F5C),
                  const Color(0xff261F5C).withOpacity(0.85),
                ],
              ),
            ),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 36,
                      left: 31,
                      right: 31,
                    ),

                    child: CoustomTextField(
                      controller: searchController,

                      onChanged: (value) {
                        setState(() {});
                        searchSong(value);
                      },
                    ),
                  ),

                  if (!isSearching) ...[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 31,
                      ),

                      child: CustomTital(
                        taxt: "Recently Played",
                      ),
                    ),

                    SizedBox(
                      height: 195,

                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 20,
                        ),

                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,

                          itemCount: allSongs.length,

                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 0),

                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.kPlayMusic,
                                arguments: index,
                              );
                            },

                            child: MusicCard(
                              imagePath: allSongs[index].imagePath,
                              songTitle: allSongs[index].songTitle,
                              artistName: allSongs[index].artistName,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                  Padding(
                    padding: const EdgeInsets.only(left: 31),

                    child: CustomTital(
                      taxt: "Recommanded music",
                    ),
                  ),

                  ListView.separated(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: filteredSongs.length,

                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 0),

                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.kPlayMusic,
                          arguments: index,
                        );
                      },

                      child: CustomSongTile(
                        imagePath: filteredSongs[index].imagePath,
                        songTitle: filteredSongs[index].songTitle,
                        artistName: filteredSongs[index].artistName,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}