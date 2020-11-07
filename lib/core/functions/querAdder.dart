import 'package:flutter/foundation.dart';

String querryAdder(
    {@required String url, @required String key, @required String values}) {
  if (url.contains('?')) {
    return url = '$url&$key=$values';
  }
  return url = '$url?$key=$values';
}
