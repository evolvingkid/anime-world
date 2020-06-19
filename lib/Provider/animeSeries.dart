import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;
import 'package:animeworld/models/animeCore.dart';
import '../global/serverDataSaver.dart' as gloabalFunction;

class AnimeSeries with ChangeNotifier {
  List<AnimeCore> _animeSeries = [];
  int currentPage = 1;
  bool isHomeScreenLoading = true;

  List<AnimeCore> get animeSeries {
    return [..._animeSeries];
  }

  Future<void> fetchDataFromServer() async {
    String _url =
        '${global.serverUrl}api/animeSeries?apikey=${global.apiKey}&random=6';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      _animeSeries = gloabalFunction.serverDataSaver(_decodeData, _animeSeries);
    } catch (e) {
      throw e;
    }

   isHomeScreenLoading = false;
   notifyListeners();
   
  }

  filterValueWithId(String id) {
    if (animeSeries.isNotEmpty) {
      List filterData = _animeSeries.where((data) => data.id == id).toList();
      return filterData;
    }
  }

  Future<void> fetchDataFromServerPagination() async {
    String _url =
        '${global.serverUrl}api/animeSeries?apikey=${global.apiKey}&pagenation=$currentPage';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      List<AnimeCore> fetchAnime =
          gloabalFunction.serverDataSaver(_decodeData, _animeSeries);
      _animeSeries.addAll(fetchAnime);
        if (_decodeData.isEmpty) {
        return;
      }
      if (fetchAnime.isEmpty) {
        fetchDataFromServerPagination();
      }
    } catch (e) {
      throw e;
    }
    currentPage++;
    notifyListeners();
  }
}
