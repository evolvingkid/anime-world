import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/gridloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnGoingAnimeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 193,
      child: GetX<AnimeState>(
        builder: (_controller) {
          return _controller.isloading.value
              ? YoutubeShimmer()
              : ListView.builder(
                  itemCount: _controller.ongoingAnime.length,
                  padding: EdgeInsets.only(top: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimeItem(
                        width: screenWidth,
                        data: _controller.ongoingAnime[index]);
                  },
                );
        },
      ),
    );
  }
}
