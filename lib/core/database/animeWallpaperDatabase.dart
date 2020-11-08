import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AnimeWallpaperDatabase extends GetxController {
  String hive = 'animeWallpaper';

  Future<void> addData(List<AnimeWallpaperModels> data) async {
    final _animeBox = Hive.box(hive);

    if (_animeBox.isEmpty) {
      await _savedSplitData(data);
      return null;
    }

    for (var i = 0; i < _animeBox.length; i++) {
      AnimeWallpaperModels _animeDataTemp = _animeBox.getAt(i);
      if (_animeDataTemp.id == data.first.id) return null;

      _savedSplitData(data);
      return null;
    }
  }

  Future<void> _savedSplitData(List<AnimeWallpaperModels> data) async {
    final _animeBox = Hive.box(hive);
    for (var _item in data) {
      await _animeBox.add(_item);
    }
  }


   Future<List<AnimeWallpaperModels>> acessData() async {
    final _animeBox = Hive.box(hive);
    List<AnimeWallpaperModels> _animeData = [];

    if (_animeBox.isEmpty) return null;

    for (var i = 0; i < _animeBox.length; i++)
      _animeData.add(_animeBox.getAt(i));

    return _animeData;
  }

}
