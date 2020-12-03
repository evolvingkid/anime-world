import 'package:animeworld/core/functions/querAdder.dart';
import 'package:flutter/foundation.dart';

String animeQueryMaker({
  @required String url,
  String title,
  String itemType,
  String skip,
  String limit,
  String sortBy,
}) {
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

  if (skip != null) {
    if (skip.isNotEmpty) {
      url = querryAdder(url: url, key: 'skip', values: skip);
    }
  }

  if (limit != null) {
    if (limit.isNotEmpty) {
      url = querryAdder(url: url, key: 'limit', values: limit);
    }
  }

  if (sortBy != null) {
    if (sortBy.isNotEmpty) {
      url = querryAdder(url: url, key: 'sortBy', values: sortBy);
    }
  }

  return url;
}
