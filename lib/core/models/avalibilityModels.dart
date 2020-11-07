import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'avalibilityModels.g.dart';

@HiveType(typeId: 3)
class AnimeAvalibility {
  @HiveField(0)
  final String channel;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String link;

  AnimeAvalibility({
    @required this.category,
    @required this.channel,
    @required this.link,
  });

  static AnimeAvalibility convert(Map data) {
    if (data == null) return null;

    AnimeAvalibility _animeAvalibility = AnimeAvalibility(
      category: data['category'],
      channel: data['channel'],
      link: data['link'],
    );

    return _animeAvalibility;
  }
}
