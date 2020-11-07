import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem(
      {Key key,
      this.width,
      this.imageUrl = 'assets/images/test_img.jpg',
      this.title = 'Boku no Hero'})
      : super(key: key);

  final double width;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 163,
      width: width != null ? width - 120 : 127,
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 183,
              width: width != null ? width - 120 : 127,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black26, Colors.black54]),
              ),
              height: 45,
              width: width != null ? width - 120 : 127,
              padding: EdgeInsets.all(5),
              alignment: Alignment.bottomLeft,
              child: Text(title,
                  maxLines: 2, style: white14, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
