import 'package:flutter/cupertino.dart';

class StreamingModels {
  final String title;
  final String url;
  final String site;
  final String tumbline;
  StreamingModels({
    @required this.site,
    @required this.title,
    @required this.tumbline,
    @required this.url,
  });

  StreamingModels covert(Map data) {

    StreamingModels _streamingData = StreamingModels(
      site: data['site'],
      title: data['title'],
      tumbline: data['thumbnail'],
      url: data['url'],
    );

    return _streamingData;
  }
}
