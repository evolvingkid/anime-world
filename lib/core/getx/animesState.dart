import 'package:animeworld/core/configs/variables.dart';
import 'package:animeworld/core/database/animeHiveDatabase.dart';
import 'package:animeworld/core/functions/animeQueryMaker.dart';
import 'package:animeworld/core/models/animeModels.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimeState extends GetxController {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();
  RxList<AnimeModels> _animeData = List<AnimeModels>().obs;
  AnimeHiveDatabase _animeHiveDatabase = AnimeHiveDatabase();
  var isloading = true.obs;
  RxString _searchString = ''.obs;
  RxString _animeType = ''.obs;

  // * for ui acessing data
  List<AnimeModels> get ongoingAnime => _animeData
      .where((e) => e.itemType.toUpperCase() == Animevalues.ongoing)
      .toList();
  List<AnimeModels> get seriesAnime => _animeData
      .where((e) => e.itemType.toUpperCase() == Animevalues.series)
      .toList();
  List<AnimeModels> get moviesAnime => _animeData
      .where((e) => e.itemType.toUpperCase() == Animevalues.movies)
      .toList();
  List<AnimeModels> get ovaAnime => _animeData
      .where((e) => e.itemType.toUpperCase() == Animevalues.ova)
      .toList();

  List<AnimeModels> get animeFilter {
    String searchString = _searchString.value;
    List<AnimeModels> _animeFilterData = [..._animeData];
    String _typeAnimeType = _animeType.value;

    if (searchString.isNotEmpty) {
      _animeFilterData = _animeFilterData
          .where(
              (e) => e.title.toLowerCase().contains(searchString.toLowerCase()))
          .toList();
    }

    if (!_typeAnimeType.isNullOrBlank) {
      _animeFilterData = _animeFilterData
          .where((element) => element.itemType.toUpperCase() == _typeAnimeType)
          .toList();
    }

    return _animeFilterData;
  }

  @override
  void onInit() {
    _acessFromDatabase();
    fetchDataFromServers(itemType: 'ONGOING');
    fetchDataFromServers(itemType: 'SERIES');
    fetchDataFromServers(itemType: 'MOVIES');
    fetchDataFromServers(itemType: 'OVA');
    super.onInit();
  }

  Future<void> fetchDataFromServers({
    String itemType,
    String title,
    String skip,
    String limit,
    bool isPagenation = false,
  }) async {
    String _url = 'api/anime_movies/list';

    if (isPagenation) {
      skip = _animeData.length.toString();
      limit = 10.toString();
    }

    _url = animeQueryMaker(
      url: _url,
      title: title,
      itemType: itemType,
      skip: skip,
      limit: limit,
    );

    print(_url);

    print('object');
    isloading.value = true;

    final _fetchdata = await _dioAPIServices
        .getAPI(url: _url)
        .catchError((e) => debugPrint(e.toString()));

         print(_fetchdata);

    if (_fetchdata.isNullOrBlank) return null;

    AnimeModels _animeTempData;

// * saving anime to list and database and filter those process
    for (var _item in _fetchdata) {
      _animeTempData = AnimeModels.convert(_item);
      if (_animeData
          .where((element) => element.title == _animeTempData.title)
          .toList()
          .isEmpty) {
        print('new file added');
        _animeData.add(_animeTempData);
        _animeHiveDatabase.addData(_animeTempData);
      }
    }
    isloading.value = false;
  }

  Future<void> _acessFromDatabase() async {
    List<AnimeModels> _tempAnimeData = await _animeHiveDatabase.acessData();

    if (_tempAnimeData.isNullOrBlank) return null;

    for (var _item in _tempAnimeData) {
      if (_animeData
          .where((element) => element.id == _item.id)
          .toList()
          .isEmpty) {
        _animeData.add(_item);
      }
    }
    isloading.value = false;
  }

  void filterData({String searchTitle, String animeType}) {
    if (!searchTitle.isNullOrBlank) {
      _searchString.value = searchTitle;
      fetchDataFromServers(title: searchTitle);
    }

    if (!animeType.isNullOrBlank) {
      _animeType.value = animeType;
    }
  }
}
