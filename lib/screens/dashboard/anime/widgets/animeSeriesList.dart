import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeSeriserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 183,
      child: GetX<AnimeState>(
        builder: (_controller) {
          return ListView.builder(
            itemCount: _controller.seriesAnime.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return AnimeItem(data: _controller.seriesAnime[index]);
            },
          );
        },
      ),
    );
  }
}
