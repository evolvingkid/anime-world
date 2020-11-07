import 'package:flutter/material.dart';
import '../../core/configs/variables.dart' as config;

class Anime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Animes",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "Anime details",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
