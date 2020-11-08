import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class WallpaperItem extends StatelessWidget {
  const WallpaperItem({
    Key key,
    this.width,
    this.imageurl,
  }) : super(key: key);
  final double width;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 163,
      width: width != null ? width : 137,
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageurl,
          fit: BoxFit.cover,
          height: 183,
          width: width != null ? width : 137,
        ),
      ),
    );
  }
}
