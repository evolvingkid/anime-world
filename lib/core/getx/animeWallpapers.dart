import 'package:animeworld/core/database/animeWallpaperDatabase.dart';
import 'package:animeworld/core/functions/animeQueryMaker.dart';
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
  RxString _searchString = ''.obs;

  List<AnimeWallpaperModels> get animeWallpaperData => [..._animeWallpaperData];
  RxBool isLoading = true.obs;

  List<AnimeWallpaperModels> get filterAnimeWallpaper {
    List<AnimeWallpaperModels> _tempAnimeData = [..._animeWallpaperData];
    String _tempSearchTxt = _searchString.value;

    if (_searchString.value.isNotEmpty) {
      _tempAnimeData = _tempAnimeData
          .where((element) =>
              element.title.toLowerCase().contains(_tempSearchTxt))
          .toList();
    }

    return _tempAnimeData;
  }

  @override
  void onInit() {
    _acessFromDatabase();
    fetchDataFromServers();
    super.onInit();
  }

  Future<void> fetchDataFromServers({
    String itemType,
    String title,
    String skip,
    String limit,
  }) async {
    String _url = 'api/wallpaper/list';

    _url = animeQueryMaker(
      url: _url,
      title: title,
      itemType: itemType,
      skip: skip,
      limit: limit,
    );

    isLoading.value = true;

    final _fetchData = await _dioAPIServices
        .getAPI(url: _url)
        .catchError((e) => debugPrint(e.toString()));

    if (_fetchData.isNullOrBlank) return null;

    isLoading.value = false;

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

    isLoading.value = false;
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

    isLoading.value = false;
  }

  void searchTitle({String title}) {
    if (!title.isNullOrBlank) {
      _searchString.value = title;
      fetchDataFromServers(title: title);
    }
  }
}
