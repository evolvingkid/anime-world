import 'package:flutter/cupertino.dart';

class AnimeAvalibility {
  final String channel;
  final String category;
  final String link;

  AnimeAvalibility({
    @required this.category,
    @required this.channel,
    @required this.link,
  });

  AnimeAvalibility convert(Map data) {
    AnimeAvalibility _animeAvalibility = AnimeAvalibility(
      category: data['category'],
      channel: data['channel'],
      link: data['link'],
    );

    return _animeAvalibility;
  }
}
