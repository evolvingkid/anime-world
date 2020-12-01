import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/gridloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeOVASList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 183,
      child: GetX<AnimeState>(
        builder: (_controller) {
          return _controller.isloading.value
              ? YoutubeShimmer()
              : ListView.builder(
                  itemCount: _controller.ovaAnime.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimeItem(data: _controller.ovaAnime[index]);
                  },
                );
        },
      ),
    );
  }
}
