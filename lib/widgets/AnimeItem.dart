import 'package:animeworld/core/models/animeModels.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem(
      {Key key,
      this.width,
      this.imageUrl = 'assets/images/test_img.jpg',
      this.data})
      : super(key: key);

  final double width;
  final String imageUrl;
  final AnimeModels data;

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
            child: Image.network(
              data.coverImg,
              fit: BoxFit.cover,
              height: 183,
              width: width != null ? width - 120 : 127,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black38, Colors.black54]),
              ),
              width: width != null ? width - 120 : 127,
              padding: EdgeInsets.all(5),
              alignment: Alignment.bottomLeft,
              child: Text(data.title,
                  maxLines: 2, style: white14, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
