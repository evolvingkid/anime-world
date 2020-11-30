import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/WallpaperItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeWallpaperList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 193,
      child: GetX<AnimeWallpapers>(builder: (_controller) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _controller.animeWallpaperData.length,
          itemBuilder: (BuildContext context, int index) {
            return WallpaperItem(
              data: _controller.animeWallpaperData[index],
            );
          },
        );
      }),
    );
  }
}
