import 'package:animeworld/core/getx/animeNews.dart';
import 'package:animeworld/widgets/NewsItemTileWide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../core/configs/variables.dart' as config;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ScrollController controller = ScrollController();

  AnimeNews animeState = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      //bottom
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
     
        int _skip = animeState.animeNewsData.length;
        animeState.fetchdataFromServers(
          skip: _skip.toString(),
          limit: '20',
        );
      }
      //top
      if (controller.offset <= controller.position.minScrollExtent &&
          !controller.position.outOfRange) {
       
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => animeState.isLoading.value
            ? Container(
                padding: EdgeInsets.all(15),
                child: LinearProgressIndicator(
                  backgroundColor: Theme.of(context).buttonColor,
                ))
            : Container(
                height: 0,
              ),
      ),
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
        controller: controller,
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
