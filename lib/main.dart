import 'package:animeworld/Provider/animeSearch.dart';
import 'package:animeworld/Provider/animeTorrent.dart';
import 'package:animeworld/screens/search/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/animeMovies.dart';
import 'Provider/animeOVA.dart';
import 'Provider/animeSeries.dart';
import 'Provider/latestAnimes.dart';
import 'Themes/themes.dart';
import 'screens/animeInfo/animeDetails.dart';
import 'screens/homePgae/homePage.dart';
import 'screens/seeAllScreen/seeAllScreen.dart';

void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LatestAnimes()),
        ChangeNotifierProvider(create: (_) => AnimeSeries()),
        ChangeNotifierProvider(create: (_) => AnimeMovies()),
        ChangeNotifierProvider(create: (_) => AnimeOVA()),
        ChangeNotifierProvider(create: (_) => AnimeTorrent()),
        ChangeNotifierProvider(create: (_) => AnimeSearch()),
      ],
      child: MaterialApp(
        title: 'Anime World',
        theme: themeData(),
        routes: {
          AnimeDetails.routeName: (ctx) => AnimeDetails(),
          SeeAllScreen.routeName: (ctx) => SeeAllScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen()
        },
        home: HomePage(),
      ),
    );
  }
}
