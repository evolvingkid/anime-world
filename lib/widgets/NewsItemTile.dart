import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItemTile extends StatelessWidget {
  const NewsItemTile({
    Key key,
    @required this.scWidth,
  }) : super(key: key);

  final double scWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dark,
      ),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/test_img.jpg',
              height: 80,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: scWidth - 140,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Hayku and rent a fireforce is making a big move ",
                  style: Theme.of(context).textTheme.headline6.merge(
                        TextStyle(color: Colors.white),
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "rent a fireforce is making a big move  fireforce is making a big move fireforce is making a big move",
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
        ],
      ),
    );
  }
}
