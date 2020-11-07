import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'streamingModels.g.dart';

@HiveType(typeId: 2)
class StreamingModels {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String site;
  @HiveField(3)
  final String tumbline;
  @HiveField(4)
  StreamingModels({
    @required this.site,
    @required this.title,
    @required this.tumbline,
    @required this.url,
  });

 static StreamingModels covert(Map data) {

    StreamingModels _streamingData = StreamingModels(
      site: data['site'],
      title: data['title'],
      tumbline: data['thumbnail'],
      url: data['url'],
    );

    return _streamingData;
  }
}
