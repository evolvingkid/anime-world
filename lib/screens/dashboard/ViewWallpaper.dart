import 'dart:io';
import 'dart:typed_data';

import 'package:animeworld/Custom/FloatingButtonSlideUp.dart';
import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:path/path.dart' as p;

class ViewWallpaper extends StatelessWidget {
  setWallpaper({String url, int location}) async {
    String path = "/data/user/0/com.evolvingkid.animeworld/";
    String name = await GetImageOrNetwork().pathFromUrl(url: url);

    File image = await GetImageOrNetwork().moveImageTo(url: url, toPath: path);
    String result;
    try {
      result = await WallpaperManager.setWallpaperFromFile(name, location);
    } catch (e) {
      result = 'Failed to get wallpaper.${e.runtimeType..runtimeType}';
    }
    print(result);
    print(name);
  }

  save(AnimeWallpaperModels data) async {
    String savePath = "/storage/emulated/0/animeworld/" + data.id + ".png";
    var response = await Dio().download(data.image, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final AnimeWallpaperModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // floatingActionButton: FloatingAnimatedSlideUp(
      //   buttons: [
      //     RaisedButton(
      //       onPressed: () {
      //         setWallpaper(
      //             url: data.image, location: WallpaperManager.LOCK_SCREEN);
      //       },
      //       child: Text(
      //         "Lock Screen",
      //         style: Theme.of(context).textTheme.button,
      //       ),
      //     ),
      //     RaisedButton(
      //       onPressed: () {
      //         setWallpaper(
      //             url: data.image, location: WallpaperManager.HOME_SCREEN);
      //       },
      //       child: Text(
      //         "Home",
      //         style: Theme.of(context).textTheme.button,
      //       ),
      //     ),
      //     RaisedButton(
      //       onPressed: () {
      //         setWallpaper(
      //             url: data.image, location: WallpaperManager.BOTH_SCREENS);
      //       },
      //       child: Text(
      //         "Both",
      //         style: Theme.of(context).textTheme.button,
      //       ),
      //     ),
      //   ],
      //   toogleButton: "Set Wallpaper",
      // ),
      floatingActionButton: RaisedButton(
        onPressed: () async {
          save(data);
        },
        child: Text(
          "Save to gallery",
          style: Theme.of(context).textTheme.button,
        ),
      ),
      body: Center(
        child: ImageOrNetWork(
          url: data.image,
        ),
      ),
    );
  }
}
