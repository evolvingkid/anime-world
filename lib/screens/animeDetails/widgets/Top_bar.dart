
import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWorldModel.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({Key key, @required this.data});

  final AnimeModels data;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 350,
      child: Stack(
        children: [
          ImageOrNetWork(
            id: data.id,
            url: data.coverImg,
            fit: BoxFit.cover,
            width: screenWidth,
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
