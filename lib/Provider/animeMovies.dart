import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;
import 'package:animeworld/models/animeCore.dart';
import '../global/serverDataSaver.dart' as gloabalFunction;

class AnimeMovies with ChangeNotifier {
  List<AnimeCore> _animeMovies;
  int currentPage = 1;

  List<AnimeCore> get animeMovies {
    return [..._animeMovies];
  }

  Future<void> fetchDataFromServer() async {
    String _url =
        '${global.serverUrl}api/animeMovies?apikey=${global.apiKey}&random=6';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      _animeMovies = gloabalFunction.serverDataSaver(_decodeData, _animeMovies);
    } catch (e) {}
  }

   filterValueWithId(String id) {
    if (_animeMovies.isNotEmpty) {
      List filterData = _animeMovies.where((data) => data.id == id).toList();
    return filterData;
    }
  }

   Future<void> fetchDataFromServerPagination() async {
    String _url =
        '${global.serverUrl}api/animeMovies?apikey=${global.apiKey}&pagenation=$currentPage';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      List<AnimeCore> fetchAnime =
          gloabalFunction.serverDataSaver(_decodeData, _animeMovies);
      _animeMovies.addAll(fetchAnime);
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
