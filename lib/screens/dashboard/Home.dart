import 'package:animeworld/core/getx/animeNews.dart';
import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/NewsItemTile.dart';
import 'package:animeworld/widgets/TitleWithButton.dart';
import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/configs/variables.dart' as config;

class Home extends StatelessWidget {
  final AnimeState animesState = Get.find();

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
            TitleWithButton(
              title: "Trending Anime",
              onTap: () {},
              padding: const EdgeInsets.all(0),
            ),
            Obx(
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
                            return AnimeItem(
                                data: _controller.ongoingAnime[index]);
                          },
                        );
                      }),
                    ),
            ),
            TitleWithButton(
              title: "Latest News",
              onTap: () {},
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            GetX<AnimeNews>(
                init: AnimeNews(),
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.animeNewsMini.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsItemTile(
                          scWidth: scWidth,
                          data: controller.animeNewsData[index]);
                    },
                  );
                }),
            TitleWithButton(
              title: "Anime Wallpapers",
              onTap: () {},
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            Container(
              width: double.infinity,
              height: 193,
              child: GetX<AnimeWallpapers>(builder: (_controller) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.animeWallpaperData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WallpaperItem(
                      data: _controller.animeWallpaperData[index],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
