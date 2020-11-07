import 'package:flutter/foundation.dart';
import 'avalibilityModels.dart';
import 'streamingModels.dart';

class AnimeModels {
  final List<String> tags;
  final List<StreamingModels> streamingData;
  final String id;
  final String itemType;
  final String title;
  final int anilistid;
  final String type;
  final String status;
  final String description;
  final String season;
  final int seasonYear;
  final int duration;
  final bool isAdult;
  final int averageScore;
  final int popularity;
  final String source;
  final String bannerImg;
  final String coverImg;
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

  AnimeModels convert(Map data) {
    AnimeModels _animeModels = AnimeModels(
      id: data['_id'],
      title: data['title'],
      anilistid: data['anilistid'],
      animeAvalibility: null,
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
      streamingData: null,
      tags: null,
      type: data['type'],
    );

    return _animeModels;
  }

  
}
