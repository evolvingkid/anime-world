import 'package:animeworld/models/animeCore.dart';

List serverDataSaver(dynamic decodeData, List realList) {
  List<AnimeCore> latestanime = [];
  for (var i = 0; i < decodeData.length; i++) {
    if (latestanime != null) {
      var whereValue = latestanime
          .where((data) => data.title == decodeData[i]['title'])
          .toList();
      if (whereValue.isNotEmpty) {
        continue;
      }
    }
    if (realList != null) {
      var whereValue = realList
          .where((data) => data.title == decodeData[i]['title'])
          .toList();
      if (whereValue.isNotEmpty) {
        continue;
      }
    }
    latestanime.add(AnimeCore(
        characters: decodeData[i]['characters'],
        tag: decodeData[i]['Tag'],
        streamEpisode: decodeData[i]['streamEpisode'],
        id: decodeData[i]['_id'],
        title: decodeData[i]['title'],
        author: decodeData[i]['author'],
        anilistId: decodeData[i]['anilistid'],
        type: decodeData[i]['type'],
        status: decodeData[i]['status'],
        description: decodeData[i]['description'],
        season: decodeData[i]['season'],
        seasonYear: decodeData[i]['seasonYear'] != null
            ? double.parse(decodeData[i]['seasonYear'])
            : null,
        duration: decodeData[i]['duration'],
        isAdult: decodeData[i]['isAdult'],
        avgScore: decodeData[i]['averageScore'],
        popularity: decodeData[i]['popularity'],
        source: decodeData[i]['source'],
        bannerImg: decodeData[i]['bannerImg'],
        coverImg: decodeData[i]['coverImg'],
        avalibility: decodeData[i]['avalibility']));
  }

  return latestanime;
}
