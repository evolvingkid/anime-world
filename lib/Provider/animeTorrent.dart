import 'dart:convert';
import 'package:animeworld/models/torrentModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../global/gobalVars.dart' as global;

class AnimeTorrent with ChangeNotifier {
  List<TorrentModal> _animeTorrentData = [];
  bool isTorrent = true;

  List<TorrentModal> get animeTorrentData {
    return [..._animeTorrentData];
  }

  void fetchDataFromServer({String title}) async {
    isTorrent = true;
    // clearing the data
    _animeTorrentData = [];
    String _url =
        '${global.serverUrl}api/horriblesub?apikey=${global.apiKey}&search=$title';
    try {
      final _fetchData = await http.get(_url);
      final _decodeData = json.decode(_fetchData.body);
      for (var i = 0; i < _decodeData.length; i++) {
        _animeTorrentData.add(TorrentModal(
            title: _decodeData[i]['title'],
            link: _decodeData[i]['link'],
            videoQuality: _decodeData[i]['videotype']));
      }
    } catch (e) {
      
    }
    isTorrent = false;
    notifyListeners();
  }
}
