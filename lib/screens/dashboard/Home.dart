import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:animeworld/screens/dashboard/Wallpaper.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/NewsItemTile.dart';
import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/configs/variables.dart' as config;

class Home extends StatelessWidget {
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
                  config.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  config.subtitle,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Anime News",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                NewsItemTile(scWidth: scWidth),
                NewsItemTile(scWidth: scWidth),
                NewsItemTile(scWidth: scWidth),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Anime Wallpapers",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: double.infinity,
              height: 193,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WallpaperItem(),
                  WallpaperItem(),
                  WallpaperItem(),
                  WallpaperItem(),
                  WallpaperItem(),
                  WallpaperItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
