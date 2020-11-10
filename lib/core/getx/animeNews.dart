import 'package:animeworld/core/database/animeNewsHiveDatabase.dart';
import 'package:animeworld/core/functions/animeQueryMaker.dart';
import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimeNews extends GetxController {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();
  List<AnimeNewsModel> _animeNewsData = List<AnimeNewsModel>().obs;
  AnimeNewsDatabase _animeNewsDatabase = AnimeNewsDatabase();
  List<AnimeNewsModel> get animeNewsData => [..._animeNewsData];
  List<AnimeNewsModel> get animeNewsMini {
    if (_animeNewsData.length < 3) {
      return _animeNewsData;
    }
    return _animeNewsData.getRange(0, 3).toList();
  }

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    _acessFromDatabase();
    fetchdataFromServers();
    super.onInit();
  }

  Future<void> fetchdataFromServers({
    String itemType,
    String title,
    String skip,
    String limit,
  }) async {
    String _url = 'api/anime_movies/list';

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

    for (var _item in _fetchData) {
      AnimeNewsModel _animeNewsTemp = AnimeNewsModel.convert(_item);

      if (_animeNewsData
          .where((element) => element.id == _animeNewsTemp.id)
          .toList()
          .isEmpty) {
        _animeNewsData.add(_animeNewsTemp);
        _animeNewsDatabase.addData(_animeNewsTemp);
      }
    }

    isLoading.value = false;
  }

  Future<void> _acessFromDatabase() async {
    List<AnimeNewsModel> _tempAnimeData = await _animeNewsDatabase.acessData();

    if (_tempAnimeData.isNullOrBlank) return null;
    for (var _item in _tempAnimeData) {
      if (_animeNewsData
          .where((element) => element.id == _item.id)
          .toList()
          .isEmpty) {
        _animeNewsData.add(_item);
      }
    }
    isLoading.value = false;
  }
}
