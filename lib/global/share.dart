import 'package:flutter/material.dart';
import 'package:share/share.dart';

share(BuildContext context, subject, data) {
    final RenderBox box = context.findRenderObject();
    Share.share(data,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }