import 'package:flutter/material.dart';
import '../../core/configs/variables.dart' as config;

class Wallpaper extends StatelessWidget {
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
                  "Anime Wallpaper",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Your favorite Anime wallpapers",
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
