import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/TitleWithButton.dart';
import 'package:animeworld/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/configs/variables.dart' as config;
import 'widgets/anime_news_list.dart';
import 'widgets/anime_wallpaper_List.dart';
import 'widgets/teadinganime_list.dart';

class Home extends StatelessWidget {
  Home({this.controller});
  final TabController controller;
  final AnimeState animesState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: config.title,
        subTitle: config.subtitle,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          tradingAnimeTitle(context),
          TreandingAnimeList(animesState: animesState),
          latestNewsAnimeTitle(),
          AnimeNewsList(),
          animeWallpaperTitle(),
          AnimeWallpaperList()
        ],
      ),
    );
  }

  TitleWithButton animeWallpaperTitle() {
    return TitleWithButton(
      title: "Anime Wallpapers",
      onTap: () {
        controller.index = 2;
      },
      padding: const EdgeInsets.symmetric(vertical: 15),
    );
  }

  TitleWithButton latestNewsAnimeTitle() {
    return TitleWithButton(
      title: "Latest News",
      onTap: () {
        controller.index = 3;
      },
      padding: const EdgeInsets.symmetric(vertical: 15),
    );
  }

  TitleWithButton tradingAnimeTitle(BuildContext context) {
    return TitleWithButton(
      title: "Trending Anime",
      onTap: () {
        Navigator.of(context)
            .pushNamed('/all_animes', arguments: config.Animevalues.ongoing);
      },
      padding: const EdgeInsets.all(0),
    );
  }


}
