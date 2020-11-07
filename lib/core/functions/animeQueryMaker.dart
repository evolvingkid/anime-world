import 'package:animeworld/core/functions/querAdder.dart';
import 'package:flutter/foundation.dart';

String animeQueryMaker({@required String url, String title, String itemType}) {
  if (title != null) {
    if (title.isNotEmpty) {
      url = querryAdder(url: url, key: 'title', values: title);
    }
  }

  if (itemType != null) {
    if (itemType.isNotEmpty) {
      url = querryAdder(url: url, key: 'item_type', values: itemType);
    }
  }

  return url;
}
