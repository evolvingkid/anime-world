import 'package:flutter/foundation.dart';

class AnimeCore {
  final dynamic characters;
  final List tag;
  final List streamEpisode;
  final String id;
  final String title;
  final String author;
  final int anilistId;
  final String type;
  final String status;
  final String description;
  final String season;
  final double seasonYear;
  final int duration;
  final bool isAdult;
  final int avgScore;
  final int popularity;
  final String source;
  final String bannerImg;
  final String coverImg;
  final dynamic avalibility;

  AnimeCore({
    @required this.characters,
    @required this.tag,
    @required this.streamEpisode,
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.anilistId,
    @required this.type,
    @required this.status,
    @required this.description,
    @required this.season,
    @required this.seasonYear,
    @required this.duration,
    @required this.isAdult,
    @required this.avgScore,
    @required this.popularity,
    @required this.source,
    @required this.bannerImg,
    @required this.coverImg,
    @required this.avalibility,
  });
}
