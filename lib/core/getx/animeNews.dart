import 'package:animeworld/core/database/animeNewsHiveDatabase.dart';
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
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    _acessFromDatabase();
    fetchdataFromServers();
    super.onInit();
  }

  Future<void> fetchdataFromServers() async {
    final _fetchData = await _dioAPIServices
        .getAPI(url: 'api/news/list')
        .catchError((e) => debugPrint(e.toString()));

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

    isLoading = false.obs;
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

    isLoading = false.obs;
  }
}
