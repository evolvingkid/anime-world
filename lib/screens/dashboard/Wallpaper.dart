import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../core/configs/variables.dart' as config;

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  ScrollController controller = ScrollController();
  AnimeWallpapers animeState = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      //bottom
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        print("bottom");
        int _skip = animeState.animeWallpaperData.length;
        animeState.fetchDataFromServers(
          skip: _skip.toString(),
          limit: '20',
        );
      }
      //top
      if (controller.offset <= controller.position.minScrollExtent &&
          !controller.position.outOfRange) {
        print("top");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    "Anime Wallpaper",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    "Your favorite Anime wallpapers",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Latest Wallpapers",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
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
                            controller.animeWallpaperData[index].isLandScape
                                ? 2
                                : 1);
                      });
                }),
              )
            ],
          ),
        ));
  }
}
