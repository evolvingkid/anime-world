import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../core/configs/variables.dart' as config;

class Anime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Animes",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Anime details",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Anime",
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              width: double.infinity,
              height: 193,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.ongoingAnime.length,
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeItem(
                          width: scWidth,
                          data: _controller.ongoingAnime[index]);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Series",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: double.infinity,
              height: 183,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.seriesAnime.length,
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeItem(data: _controller.seriesAnime[index]);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Movies",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: double.infinity,
              height: 183,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.moviesAnime.length,
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeItem(data: _controller.moviesAnime[index]);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "OVA",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: double.infinity,
              height: 183,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.ovaAnime.length,
                    padding: EdgeInsets.only(top: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeItem(data: _controller.ovaAnime[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
