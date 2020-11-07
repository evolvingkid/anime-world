import 'package:animeworld/widgets/NewsItemTileWide.dart';
import 'package:flutter/material.dart';
import '../../core/configs/variables.dart' as config;

class News extends StatelessWidget {
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
                  "Anime News",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Latest Anime News",
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Trending News",
            style: Theme.of(context).textTheme.headline6,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            scrollDirection: Axis.vertical,
            children: [
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
              NewsItemTileWide(scWidth: scWidth),
            ],
          ),
        ]),
      ),
    );
  }
}
