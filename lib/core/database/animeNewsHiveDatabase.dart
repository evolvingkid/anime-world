import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:hive/hive.dart';

class AnimeNewsDatabase {
   String hive = 'animeNews';

   Future<int> addData(AnimeNewsModel animeNewsModel) async {
     try {
      final _animeBox = Hive.box(hive);
      if (_animeBox.isEmpty) {
        return await _animeBox.add(animeNewsModel);
      }

      for (var i = 0; i < _animeBox.length; i++) {
        AnimeNewsModel _animeDataTemp = _animeBox.getAt(i);
        if (_animeDataTemp.id == animeNewsModel.id) return null;
      }

      return await _animeBox.add(animeNewsModel);
    } catch (e) {
      throw e;
    }
   }

  Future<List<AnimeNewsModel>> acessData() async {
    final _animeBox = Hive.box(hive);
    List<AnimeNewsModel> _animeData = [];

    if (_animeBox.isEmpty) return null;

    for (var i = 0; i < _animeBox.length; i++)
      _animeData.add(_animeBox.getAt(i));

    return _animeData;
  }

}