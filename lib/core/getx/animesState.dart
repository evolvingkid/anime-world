import 'package:animeworld/core/models/animeModels.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimeState extends GetxController {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();
  List<AnimeModels> _animeData = [];

  @override
  void onInit() {
    fetchDataFromServers();
    super.onInit();
  }

  Future<void> fetchDataFromServers() async {
    final _fetchdata = await _dioAPIServices
        .getAPI(url: 'api/anime_movies/list')
        .catchError((e) => debugPrint(e.toString()));

    if (_fetchdata.isNullOrBlank) return null;

    AnimeModels _animeTempData;

    for (var _item in _fetchdata) {
      _animeTempData = AnimeModels.convert(_item);
      if (_animeData
          .where((element) => element.id == _animeTempData.id)
          .toList()
          .isEmpty) {
        _animeData.add(_animeTempData);
      }
    }
    
  }
}
