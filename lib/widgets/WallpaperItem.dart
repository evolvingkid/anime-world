import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class WallpaperItem extends StatelessWidget {
  const WallpaperItem({
    Key key,
    this.width,
    this.data,
    this.margin = const EdgeInsets.only(right: 10),
  }) : super(key: key);
  final double width;
  final AnimeWallpaperModels data;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 163,
      width: data.isLandScape ? 280 : 127,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageOrNetWork(
          id: data.id,
          url: data.image,
          fit: BoxFit.cover,
          height: 183,
          width: data.isLandScape ? 280 : 127,
        ),
      ),
    );
  }
}
