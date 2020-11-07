import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
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
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                  AnimeItem(width: scWidth),
                ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                  AnimeItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
