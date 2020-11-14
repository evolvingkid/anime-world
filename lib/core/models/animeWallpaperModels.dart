import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'animeWallpaperModels.g.dart';

@HiveType(typeId: 5)
class AnimeWallpaperModels {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final bool isLandScape;

  AnimeWallpaperModels({
    @required this.id,
    @required this.title,
    @required this.image,
    this.isLandScape = false,
  });

  static List<AnimeWallpaperModels> convert(Map data) {
    if (data == null) return null;

    List<AnimeWallpaperModels> _animeWallapaperTemp = [];

    _animeWallapaperTemp.add(AnimeWallpaperModels(
      id: data['_id'],
      title: data['title'],
      image: data['bannerImg'],
      isLandScape: true,
    ));

    _animeWallapaperTemp.add(AnimeWallpaperModels(
      id: data['_id'],
      title: data['title'],
      image: data['coverImg'],
      isLandScape: false,
    ));

    return _animeWallapaperTemp;
  }
}
