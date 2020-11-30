import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:animeworld/widgets/TitleWithButton.dart';
import 'package:animeworld/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../../core/configs/variables.dart' as config;
import 'widgets/animeMovies.dart';
import 'widgets/animeOVA.dart';
import 'widgets/animeSeriesList.dart';
import 'widgets/onGoingAnime_list.dart';

class Anime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'Animes',
          subTitle: 'Anime details',
          actions: [searchBtn(context)]),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          treadingAnimeTitle(context),
          OnGoingAnimeList(),
          animeSeriesTitle(context),
          AnimeSeriserList(),
          animeMoviesTitle(context),
          AnimeMoviesList(),
          animeOVATitle(context),
          AnimeOVASList(),
        ],
      ),
    );
  }

  TitleWithButton animeOVATitle(BuildContext context) {
    return TitleWithButton(
      padding: const EdgeInsets.symmetric(vertical: 15),
      title: "OVA",
      onTap: () {
        Navigator.of(context)
            .pushNamed('/all_animes', arguments: config.Animevalues.ova);
      },
    );
  }

  TitleWithButton animeMoviesTitle(BuildContext context) {
    return TitleWithButton(
      padding: const EdgeInsets.symmetric(vertical: 15),
      title: "Movies",
      onTap: () {
        Navigator.of(context)
            .pushNamed('/all_animes', arguments: config.Animevalues.movies);
      },
    );
  }

  TitleWithButton animeSeriesTitle(BuildContext context) {
    return TitleWithButton(
      padding: const EdgeInsets.symmetric(vertical: 15),
      title: "Series",
      onTap: () {
        Navigator.of(context)
            .pushNamed('/all_animes', arguments: config.Animevalues.series);
      },
    );
  }

  TitleWithButton treadingAnimeTitle(BuildContext context) {
    return TitleWithButton(
      title: "Trending Anime",
      onTap: () {
        Navigator.of(context)
            .pushNamed('/all_animes', arguments: config.Animevalues.ongoing);
      },
    );
  }

  IconButton searchBtn(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search_rounded),
      onPressed: () {
        Navigator.pushNamed(context, '/anime_search');
      },
    );
  }
}
