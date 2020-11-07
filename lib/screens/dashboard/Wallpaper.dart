import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/configs/variables.dart' as config;

class Wallpaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: StaggeredGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 0.0,
                  crossAxisCount: 3,
                  children: [
                    WallpaperItem(width: 254),
                    WallpaperItem(),
                    WallpaperItem(width: 254),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                    WallpaperItem(),
                  ],
                  staggeredTiles: [
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(2),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
