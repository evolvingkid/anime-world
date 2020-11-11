import 'package:animeworld/Custom/FloatingButtonSlideUp.dart';
import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewWallpaper extends StatelessWidget {
  setWallpaper({String url, int location}) async {
    String path = await GetImageOrNetwork().pathFromUrl(url: url);

    // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    try {} on PlatformException {
      result = 'Failed to get wallpaper.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final AnimeWallpaperModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingAnimatedSlideUp(
        buttons: [
          RaisedButton(
            onPressed: () {
              setWallpaper(url: data.image, location: 1);
            },
            child: Text(
              "Lock Screen",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          RaisedButton(
            onPressed: () {
              setWallpaper(url: data.image, location: 2);
            },
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          RaisedButton(
            onPressed: () {
              setWallpaper(url: data.image, location: 1);
            },
            child: Text(
              "Both",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
        toogleButton: "Set Wallpaper",
      ),
      body: Center(
        child: ImageOrNetWork(
          url: data.image,
        ),
      ),
    );
  }
}
