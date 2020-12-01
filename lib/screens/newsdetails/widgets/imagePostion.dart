import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:flutter/material.dart';

class ImagePostions extends StatelessWidget {
  const ImagePostions({
    Key key,
    @required this.scWidth,
    @required this.data,
  }) : super(key: key);

  final double scWidth;
  final AnimeNewsModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scWidth,
      height: 350,
      child: Stack(
        children: [
          ImageOrNetWork(
            id: data.id,
            url: data.thumb,
            fit: BoxFit.cover,
            width: scWidth,
            height: 347,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.0001),
                  Color.fromRGBO(255, 255, 255, 0.0001),
                  Theme.of(context).scaffoldBackgroundColor
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                data.title,
                style: Theme.of(context).textTheme.headline3,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}