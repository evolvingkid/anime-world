import 'dart:math';

import 'package:animeworld/core/database/animeWallpaperDatabase.dart';
import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AnimeWallpapers extends GetxController {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();
  List<AnimeWallpaperModels> _animeWallpaperData =
      List<AnimeWallpaperModels>().obs;
  AnimeWallpaperDatabase _animeWallpaperDatabase = AnimeWallpaperDatabase();
  List<AnimeWallpaperModels> get animeWallpaperData => [..._animeWallpaperData];
  
  @override
  void onInit() {
    _acessFromDatabase();
    fetchDataFromServers();
    super.onInit();
  }

  Future<void> fetchDataFromServers() async {
    final _fetchData = await _dioAPIServices
        .getAPI(url: 'api/wallpaper/list')
        .catchError((e) => debugPrint(e.toString()));

    if (_fetchData.isNullOrBlank) return null;

    for (var _item in _fetchData) {
      List<AnimeWallpaperModels> _animeWallpaperListTemp =
          AnimeWallpaperModels.convert(_item);

      if (_animeWallpaperData
          .where((element) => element.id == _animeWallpaperListTemp.first.id)
          .toList()
          .isEmpty) {
        _animeWallpaperData.addAll(_animeWallpaperListTemp);
        _animeWallpaperDatabase.addData(_animeWallpaperListTemp);
      }
    }
  }

  Future<void> _acessFromDatabase() async {
    List<AnimeWallpaperModels> _tempAnimeData =
        await _animeWallpaperDatabase.acessData();

    if (_tempAnimeData.isNullOrBlank) return null;
    for (var _item in _tempAnimeData) {
      if (_animeWallpaperData
          .where((element) => element.id == _item.id)
          .toList()
          .isEmpty) {
        _animeWallpaperData.add(_item);
      }
    }
  }
}
