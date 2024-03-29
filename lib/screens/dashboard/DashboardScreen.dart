import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:animeworld/core/services/firebaseServices.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:animeworld/screens/dashboard/Anime.dart';
import 'package:animeworld/screens/dashboard/Home.dart';
import 'package:animeworld/screens/dashboard/News.dart';
import 'package:animeworld/screens/dashboard/Wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/configs/variables.dart' as config;

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
    // final currentAddress = Provider.of<AddressProvider>(context,listen: false).currentAddress;
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  FirebaseNotificationservices _firebaseMessaging =
      locator<FirebaseNotificationservices>();

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('on Message');
    debugPrint(message.toString());
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('on launch');
    debugPrint(message.toString());
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('on onResume');
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
        bottomNavigationBar: Container(
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
              TabBarImageIcon(
                  icon: Icon(Icons.new_releases_rounded), text: "News"),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Home(controller: controller),
            Anime(),
            Wallpaper(),
            News(),
          ],
        ));
  }
}

class TabBarImageIcon extends StatelessWidget {
  const TabBarImageIcon({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      child: Column(
        children: [
          icon,
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
