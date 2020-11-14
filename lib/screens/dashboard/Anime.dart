import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/TitleWithButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../core/configs/variables.dart' as config;

class Anime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/anime_search');
            },
          )
        ],
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
            TitleWithButton(
              title: "Trending Anime",
              onTap: () {
                Navigator.of(context).pushNamed('/all_animes',
                    arguments: config.Animevalues.ongoing);
              },
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
            TitleWithButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              title: "Series",
              onTap: () {
                Navigator.of(context).pushNamed('/all_animes',
                    arguments: config.Animevalues.series);
              },
            ),
            Container(
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
            ),
            TitleWithButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              title: "Movies",
              onTap: () {
                Navigator.of(context).pushNamed('/all_animes',
                    arguments: config.Animevalues.movies);
              },
            ),
            Container(
              width: double.infinity,
              height: 183,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.moviesAnime.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeItem(data: _controller.moviesAnime[index]);
                    },
                  );
                },
              ),
            ),
            TitleWithButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              title: "OVA",
              onTap: () {
                Navigator.of(context).pushNamed('/all_animes',
                    arguments: config.Animevalues.ova);
              },
            ),
            Container(
              width: double.infinity,
              height: 183,
              child: GetX<AnimeState>(
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.ovaAnime.length,
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
