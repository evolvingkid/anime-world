import 'package:animeworld/core/getx/animeNews.dart';
import 'package:animeworld/widgets/NewsItemTileWide.dart';
import 'package:animeworld/widgets/customAppBar.dart';
import 'package:animeworld/widgets/listViewShimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ScrollController controller = ScrollController();
  AnimeNews animeState = Get.find();

  void scrollController() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      int _skip = animeState.animeNewsData.length;
      animeState.fetchdataFromServers(skip: _skip.toString(), limit: '20');
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollController);
  }

  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Anime News',
        subTitle: 'Latest Anime News',
      ),
      body: ListView(
        controller: controller,
        padding: EdgeInsets.all(10),
        children: [
          tradingnewsTitle(context),
          newsList(scWidth),
        ],
      ),
      bottomNavigationBar: loadingNews(context),
    );
  }

  Obx loadingNews(BuildContext context) {
    return Obx(() => animeState.isLoading.value
        ? Container(
            padding: EdgeInsets.all(15),
            child: LinearProgressIndicator(
                backgroundColor: Theme.of(context).buttonColor))
        : const SizedBox());
  }

  GetX<AnimeNews> newsList(double scWidth) {
    return GetX<AnimeNews>(builder: (controller) {
      return controller.isLoading.value
          ? Center(child: ListViewShinner(width: scWidth * 0.6))
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.animeNewsData.length,
              itemBuilder: (BuildContext context, int index) =>
                  NewsItemTileWide(
                      scWidth: scWidth, data: controller.animeNewsData[index]),
            );
    });
  }

  Text tradingnewsTitle(BuildContext context) =>
      Text("Trending News", style: Theme.of(context).textTheme.headline6);
}
