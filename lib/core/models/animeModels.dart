import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'avalibilityModels.dart';
import 'streamingModels.dart';

part 'animeModels.g.dart';

@HiveType(typeId: 1)
class AnimeModels {
  @HiveField(0)
  final List<String> tags;
  @HiveField(1)
  final List<StreamingModels> streamingData;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String itemType;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final int anilistid;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final String status;
  @HiveField(8)
  final String description;
  @HiveField(9)
  final String season;
  @HiveField(10)
  final int seasonYear;
  @HiveField(11)
  final int duration;
  @HiveField(12)
  final bool isAdult;
  @HiveField(13)
  final int averageScore;
  @HiveField(14)
  final int popularity;
  @HiveField(15)
  final String source;
  @HiveField(16)
  final String bannerImg;
  @HiveField(17)
  final String coverImg;
  @HiveField(18)
  final List<AnimeAvalibility> animeAvalibility;

  AnimeModels({
    @required this.id,
    @required this.title,
    @required this.anilistid,
    @required this.animeAvalibility,
    @required this.averageScore,
    @required this.bannerImg,
    @required this.coverImg,
    @required this.description,
    @required this.duration,
    @required this.isAdult,
    @required this.itemType,
    @required this.popularity,
    @required this.season,
    @required this.seasonYear,
    @required this.source,
    @required this.status,
    @required this.streamingData,
    @required this.tags,
    @required this.type,
  });

  static AnimeModels convert(Map data) {

    List<AnimeAvalibility> _tempAnimeAvalibity = [];
    for (var _tempAvalibility in data['avalibility']) {
      _tempAnimeAvalibity.add(AnimeAvalibility.convert(_tempAvalibility['animesData']));
    }

    List<StreamingModels> _streamingDataTemp = [];
    for (var _tempStreamEpisode in data['streamEpisode']) {
      _streamingDataTemp.add(StreamingModels.covert(_tempStreamEpisode));
    }

    AnimeModels _animeModels = AnimeModels(
      id: data['_id'],
      title: data['title'],
      anilistid: data['anilistid'],
      animeAvalibility: _tempAnimeAvalibity,
      averageScore: data['averageScore'],
      bannerImg: data['bannerImg'],
      coverImg: data['coverImg'],
      description: data['description'],
      duration: data['duration'],
      isAdult: data['isAdult'],
      itemType: data['item_type'],
      popularity: data['popularity'],
      season: data['season'],
      seasonYear: data['seasonYear'],
      source: data['source'],
      status: data['status'],
      streamingData: _streamingDataTemp,
      tags: null,
      type: data['type'],
    );

    return _animeModels;
  }
}
