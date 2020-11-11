import 'package:animeworld/core/getx/animeNews.dart';
import 'package:animeworld/widgets/NewsItemTileWide.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
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
          GetX<AnimeNews>(builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.animeNewsData.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsItemTileWide(
                    scWidth: scWidth, data: controller.animeNewsData[index]);
              },
            );
          }),
        ]),
      ),
    );
  }
}
