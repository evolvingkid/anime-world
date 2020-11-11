import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItemTileWide extends StatelessWidget {
  const NewsItemTileWide({
    Key key,
    @required this.scWidth,
    this.data,
  }) : super(key: key);

  final double scWidth;
  final AnimeNewsModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/news', arguments: data);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: dark,
        ),
        height: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageOrNetWork(
                url: data.thumb,
                id: data.id,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black38, Colors.black87]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      data.title,
                      style: Theme.of(context).textTheme.headline6.merge(
                            TextStyle(color: Colors.white),
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .merge(TextStyle(color: Colors.white)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
