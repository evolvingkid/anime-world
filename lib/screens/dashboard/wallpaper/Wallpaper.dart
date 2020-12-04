import 'package:admob_flutter/admob_flutter.dart';
import 'package:animeworld/core/ads/ad_manager.dart';
import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:animeworld/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  ScrollController controller = ScrollController();
  AnimeWallpapers animeState = Get.find();

  void scrollListenController() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      int _skip = animeState.animeWallpaperData.length;
      animeState.fetchDataFromServers(skip: _skip.toString(), limit: '20');
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListenController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Anime Wallpaper',
        subTitle: 'Your favorite Anime wallpapers',
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          latestWallpapertitle(context),
          wallpaperListView(),
        ],
      ),
      bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
            AdmobBanner(
                adUnitId: AdManager.wallpaperBanner,
                adSize: AdmobBannerSize.BANNER),
          Obx(
            () => animeState.isLoading.value
                ? loadingScreen(context)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Container wallpaperListView() {
    return Container(
      width: double.infinity,
      child: GetX<AnimeWallpapers>(builder: (controller) {
        return StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            itemCount: controller.animeWallpaperData.length,
            itemBuilder: (ctx, index) {
              return WallpaperItem(
                  margin: EdgeInsets.all(0),
                  data: controller.animeWallpaperData[index]);
            },
            staggeredTileBuilder: (int index) {
              return new StaggeredTile.fit(
                  controller.animeWallpaperData[index].isLandScape ? 2 : 1);
            });
      }),
    );
  }

  Text latestWallpapertitle(BuildContext context) {
    return Text("Latest Wallpapers",
        style: Theme.of(context).textTheme.headline6);
  }

  Container loadingScreen(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).buttonColor));
  }
}
