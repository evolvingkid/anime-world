import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'animeNewsModel.g.dart';

@HiveType(typeId: 4)
class AnimeNewsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String pubDate;
  @HiveField(5)
  final String link;
  @HiveField(6)
  final String guid;
  @HiveField(7)
  final String thumb;
  @HiveField(8)
  final String content;

  AnimeNewsModel({
    @required this.id,
    @required this.description,
    @required this.link,
    @required this.title,
    @required this.author,
    @required this.guid,
    @required this.pubDate,
    @required this.content,
    @required this.thumb,
  });

  static AnimeNewsModel convert(Map data) {
    if (data == null) return null;
    AnimeNewsModel _animeNewsData = AnimeNewsModel(
      id: data['_id'],
      description: data['description'],
      link: data['link'],
      title: data['title'],
      author: data['author'],
      guid: data['guid'],
      pubDate: data['pubDate'],
      thumb: data['thumb'],
      content: data['content'],
    );

    return _animeNewsData;
  }
}
