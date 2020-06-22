import 'package:animeworld/models/animeCore.dart';
import 'package:flutter/material.dart';

import 'moreInfoBanner.dart';

class AnimeDetailsWidegts extends StatelessWidget {
  AnimeDetailsWidegts({
    @required this.screenWidth,
    @required this.decription,
    @required this.animeData,
  });

  final double screenWidth;
  final String decription;
  final AnimeCore animeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        statusBanner(context, screenWidth),
        const SizedBox(height: 20),
        Text('Description',
            style: Theme.of(context).primaryTextTheme.headline5),
        const SizedBox(height: 10),
        Text(decription, style: Theme.of(context).primaryTextTheme.bodyText1),
        const SizedBox(height: 20),
        InfoBanner(
          stattics1: 'Type : ${animeData.type}',
          stattics2: 'Season: ${animeData.season}',
          stattics3: 'Status : ${animeData.status}',
          stattics4: 'SeasonYear: ${animeData.seasonYear.toString()}',
          stattics5: 'Tag:',
        ),
      ],
    );
  }

  Container statusBanner(BuildContext context, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          bannerContents(context, screenWidth,
              headingTxt: 'Average Score',
              statusTxt: animeData.avgScore.toString()),
          bannerContents(context, screenWidth,
              headingTxt: 'Popularity',
              statusTxt: animeData.popularity.toString(),
              exeptionCaseWidth: screenWidth * 0.23),
          bannerContents(context, screenWidth,
              headingTxt: 'Duration',
              statusTxt: animeData.duration.toString())
        ],
      ),
    );
  }

  Container bannerContents(BuildContext context, double screenWidth,
      {@required String headingTxt,
      @required String statusTxt,
      double exeptionCaseWidth}) {
    return Container(
      width: screenWidth * 0.3,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text(headingTxt, style: Theme.of(context).primaryTextTheme.bodyText1),
        Container(
            width: exeptionCaseWidth == null
                ? screenWidth * 0.1
                : exeptionCaseWidth,
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(statusTxt,
                    style: Theme.of(context).primaryTextTheme.headline5)))
      ]),
    );
  }
}
