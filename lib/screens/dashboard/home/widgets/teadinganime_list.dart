
import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreandingAnimeList extends StatelessWidget {
  TreandingAnimeList({
    @required this.animesState,
  });

  final AnimeState animesState;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => animesState.isloading.value
          ? const SizedBox()
          : Container(
              width: double.infinity,
              height: 193,
              child: GetX<AnimeState>(builder: (_controller) {
                return ListView.builder(
                  itemCount: _controller.ongoingAnime.length,
                  padding: EdgeInsets.only(top: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimeItem(data: _controller.ongoingAnime[index]);
                  },
                );
              }),
            ),
    );
  }
}
