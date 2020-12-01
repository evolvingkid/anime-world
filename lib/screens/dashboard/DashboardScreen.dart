import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:animeworld/core/services/firebaseServices.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:animeworld/screens/dashboard/anime/Anime.dart';
import 'package:animeworld/screens/dashboard/home/Home.dart';
import 'package:animeworld/screens/dashboard/news/News.dart';
import 'package:animeworld/screens/dashboard/wallpaper/Wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/tabBarIcon.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final animesState = Get.put(AnimeState());
  final animeNews = Get.put(AnimeNews());
  final animeWallpapers = Get.put(AnimeWallpapers());
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  FirebaseNotificationservices _firebaseMessaging =
      locator<FirebaseNotificationservices>();

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    debugPrint(message.toString());
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    debugPrint(message.toString());
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    debugPrint(message.toString());
  }

  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.onMessageSet(
      onMessage: onMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Home(controller: controller),
          Anime(),
          Wallpaper(),
          News(),
        ],
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Container bottomBar(BuildContext context) {
    return Container(
      color: dark,
      child: TabBar(
        controller: controller,
        indicatorColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Color(0xffB4B3B3),
        labelColor: Theme.of(context).selectedRowColor,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
        labelPadding: EdgeInsets.symmetric(vertical: 5),
        tabs: [
          TabBarImageIcon(icon: Icon(Icons.home_rounded), text: "Home"),
          TabBarImageIcon(icon: Icon(Icons.movie_rounded), text: "Anime"),
          TabBarImageIcon(
              icon: Icon(Icons.wallpaper_rounded), text: "Wallpaper"),
          TabBarImageIcon(icon: Icon(Icons.new_releases_rounded), text: "News"),
        ],
      ),
    );
  }
}
