import 'package:flutter/material.dart';
import '../../core/configs/variables.dart' as config;

class Home extends StatelessWidget {
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
                  config.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  config.subtitle,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Anime",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              width: double.infinity,
              height: 163,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan,
                    ),
                    height: 163,
                    width: 127,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/test_img.jpg',
                            fit: BoxFit.cover,
                            height: 163,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Boku no Tonari ni Ankoku Hakaishin ga Imasu",
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
