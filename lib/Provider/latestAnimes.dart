import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;
import 'package:animeworld/models/animeCore.dart';
import '../global/serverDataSaver.dart' as gloabalFunction;

class LatestAnimes with ChangeNotifier {
  List<AnimeCore> _latestAnimeData;
  bool homeScreenLoading = true;
  int latestAnime = 0;

  List<AnimeCore> get latestAnimeData {
    return [..._latestAnimeData];
  }

  Future<void> fetchDataFromServer() async {
    String _url =
        '${global.serverUrl}api/animeTrending?apikey=${global.apiKey}';

    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      _latestAnimeData =
          gloabalFunction.serverDataSaver(_decodeData, _latestAnimeData);
    } catch (e) {
      print('error on latest anime');
    }

    homeScreenLoading = false;
    notifyListeners();
  }

  filterValueWithId(String id) {
    if (_latestAnimeData.isNotEmpty) {
      List filterData =
          _latestAnimeData.where((data) => data.id == id).toList();
      return filterData;
    }
  }

  // for the banner chnager
  void changeLatestAnime(int val) {
    if (val != -1) {
      latestAnime = val;
    }
    notifyListeners();
  }
}
