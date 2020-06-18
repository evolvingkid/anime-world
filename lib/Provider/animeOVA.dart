import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;
import 'package:animeworld/models/animeCore.dart';
import '../global/serverDataSaver.dart' as gloabalFunction;

class AnimeOVA with ChangeNotifier {
  List<AnimeCore> _animeOVA;
  int currentPage = 1;
  bool isHomePageLoading = true;

  List<AnimeCore> get animeOVA {
    return [..._animeOVA];
  }

  Future<void> fetchDataFromServer() async {
    String _url =
        '${global.serverUrl}api/animeOVA?apikey=${global.apiKey}&random=6';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      
      _animeOVA = gloabalFunction.serverDataSaver(_decodeData, _animeOVA);
    } catch (e) {}

    isHomePageLoading = false;
    notifyListeners();
  }

    filterValueWithId(String id) {
    if (_animeOVA.isNotEmpty) {
      List filterData = _animeOVA.where((data) => data.id == id).toList();
    return filterData;
    }
  }

    Future<void> fetchDataFromServerPagination() async {
    String _url =
        '${global.serverUrl}api/animeOVA?apikey=${global.apiKey}&pagenation=$currentPage';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      List<AnimeCore> fetchAnime =
          gloabalFunction.serverDataSaver(_decodeData, _animeOVA);
      _animeOVA.addAll(fetchAnime);
      if (_decodeData.isEmpty) {
        return;
      }
      if (fetchAnime.isEmpty) {
        fetchDataFromServerPagination();
      }
    } catch (e) {}
  
    currentPage++;
    notifyListeners();
  }
}
