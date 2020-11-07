import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class WallpaperItem extends StatelessWidget {
  const WallpaperItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 163,
      width: 127,
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/test_img.jpg',
          fit: BoxFit.cover,
          height: 183,
        ),
      ),
    );
  }
}
