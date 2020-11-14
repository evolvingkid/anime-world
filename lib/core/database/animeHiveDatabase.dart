import 'package:animeworld/core/models/animeModels.dart';
import 'package:hive/hive.dart';

class AnimeHiveDatabase {
  String hive = 'animeData';

  Future<int> addData(AnimeModels animeData) async {
    try {
      final _animeBox = Hive.box(hive);
      if (_animeBox.isEmpty) {
        return await _animeBox.add(animeData);
      }

      for (var i = 0; i < _animeBox.length; i++) {
        AnimeModels _animeDataTemp = _animeBox.getAt(i);
        if (_animeDataTemp.id == animeData.id) return null;
      }

      return await _animeBox.add(animeData);
    } catch (e) {
      throw e;
    }
  }

  Future<List<AnimeModels>> acessData() async {
    final _animeBox = Hive.box(hive);
    List<AnimeModels> _animeData = [];

    if (_animeBox.isEmpty) return null;

    for (var i = 0; i < _animeBox.length; i++)
      _animeData.add(_animeBox.getAt(i));

    return _animeData;
  }
}
