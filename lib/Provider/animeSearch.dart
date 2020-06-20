import 'dart:convert';
import 'package:animeworld/models/animeCore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;

class AnimeSearch with ChangeNotifier {
  List<AnimeCore> _animeSearchData = [];

  List<AnimeCore> get animeSearchData {
    return [..._animeSearchData];
  }

  void fetchDataFromServer({String title}) async {
    _animeSearchData = [];
    String _url =
        '${global.serverUrl}api/animeOVA?apikey=${global.apiKey}&search=$title&page=1';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);

      for (var i = 0; i < _decodeData.length; i++) {
        _animeSearchData.add(AnimeCore(
            characters: _decodeData[i]['characters'],
            tag: _decodeData[i]['Tag'],
            streamEpisode: _decodeData[i]['streamEpisode'],
            id: _decodeData[i]['_id'],
            title: _decodeData[i]['title'],
            author: _decodeData[i]['author'],
            anilistId: _decodeData[i]['anilistid'],
            type: _decodeData[i]['type'],
            status: _decodeData[i]['status'],
            description: _decodeData[i]['description'],
            season: _decodeData[i]['season'],
            seasonYear: double.parse(_decodeData[i]['seasonYear']),
            duration: _decodeData[i]['duration'],
            isAdult: _decodeData[i]['isAdult'],
            avgScore: _decodeData[i]['averageScore'],
            popularity: _decodeData[i]['popularity'],
            source: _decodeData[i]['source'],
            bannerImg: _decodeData[i]['bannerImg'],
            coverImg: _decodeData[i]['coverImg'],
            avalibility: _decodeData[i]['avalibility']));
      }
    } catch (e) {}
    print('finish');
    notifyListeners();
  }


    filterValueWithId(String id) {
    if (_animeSearchData.isNotEmpty) {
      List filterData = _animeSearchData.where((data) => data.id == id).toList();
    return filterData;
    }
  }
}
