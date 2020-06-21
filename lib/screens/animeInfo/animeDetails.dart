import 'package:animeworld/Provider/animeMovies.dart';
import 'package:animeworld/Provider/animeOVA.dart';
import 'package:animeworld/Provider/animeSearch.dart';
import 'package:animeworld/Provider/animeSeries.dart';
import 'package:animeworld/Provider/animeTorrent.dart';
import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/widgets/moreInfoBanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modalSheetBody.dart';

class AnimeDetails extends StatelessWidget {
  static const routeName = './animeDetails';
  final scaffoldState = GlobalKey<ScaffoldState>();
  Map _argumnets;
  List animeData;
  String decription;
  String tagString;
  double _screenHeight;

  modelSheetOpeining(context, String type, GlobalKey<ScaffoldState> key) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return modelSheetBody(context, type, animeData, _screenHeight, key);
      },
    );
  }

  acessData(context) {
    switch (_argumnets['type']) {
      case 'Series':
        animeData = Provider.of<AnimeSeries>(context)
            .filterValueWithId(_argumnets['id']);
        break;
      case 'Movies':
        animeData = Provider.of<AnimeMovies>(context)
            .filterValueWithId(_argumnets['id']);
        break;
      case 'OVA':
        animeData =
            Provider.of<AnimeOVA>(context).filterValueWithId(_argumnets['id']);
        break;
      case 'animeLatest':
        animeData = Provider.of<LatestAnimes>(context)
            .filterValueWithId(_argumnets['id']);
        break;
      case 'search':
        animeData = Provider.of<AnimeSearch>(context)
            .filterValueWithId(_argumnets['id']);
        break;

      default:
        animeData = [];
    }

    Provider.of<AnimeTorrent>(context, listen: false)
        .fetchDataFromServer(title: animeData[0].title);
        
    decription = animeData[0].description.replaceAll('<br>', ' ');
    decription = decription.replaceAll('<i>', ' ');
    decription = decription.replaceAll('</i>', ' ');
  }

  @override
  Widget build(BuildContext context) {
    _argumnets = ModalRoute.of(context).settings.arguments;
    _screenHeight = MediaQuery.of(context).size.height;
    acessData(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldState,
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            frontImageBanner(context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // *using the coloum is good to manage the padding in one go
                children: <Widget>[
                  headingTxt(context),
                  const SizedBox(height: 30),
                  statusBanner(context, screenWidth),
                  const SizedBox(height: 20),
                  Text('Description',
                      style: Theme.of(context).primaryTextTheme.headline5),
                  const SizedBox(height: 10),
                  Text(decription,
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                  const SizedBox(height: 20),
                  InfoBanner(
                    stattics1: 'Type : ${animeData[0].type}',
                    stattics2: 'Season: ${animeData[0].season}',
                    stattics3: 'Status : ${animeData[0].status}',
                    stattics4:
                        'SeasonYear: ${animeData[0].seasonYear.toString()}',
                    stattics5: 'Tag:',
                  ),
                  const SizedBox(height: 20),
                  Text('Avalibility',
                      style: Theme.of(context).primaryTextTheme.headline5),
                  const SizedBox(height: 20),
                  avalibilityListView(context, scaffoldState)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Container avalibilityListView(context, GlobalKey<ScaffoldState> key) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          animeData[0].streamEpisode.isNotEmpty
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                      onPressed: () {
                        modelSheetOpeining(context, 'Streaming', key);
                      },
                      child: Text('Stream Video')),
                )
              : SizedBox(),
          animeData[0].avalibility.isNotEmpty
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                      onPressed: () {
                        modelSheetOpeining(context, 'Anime Kayo', key);
                      },
                      child: Text('Downloads')),
                )
              : SizedBox(),
          Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                  onPressed: () {
                    modelSheetOpeining(context, 'Torrent', key);
                  },
                  child: Text('Torrent')))
        ],
      ),
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
              statusTxt: animeData[0].avgScore.toString()),
          bannerContents(context, screenWidth,
              headingTxt: 'Popularity',
              statusTxt: animeData[0].popularity.toString(),
              exeptionCaseWidth: screenWidth * 0.23),
          bannerContents(context, screenWidth,
              headingTxt: 'Duration',
              statusTxt: animeData[0].duration.toString())
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

  Hero headingTxt(BuildContext context) {
    return Hero(
        tag: animeData[0].title,
        child: Text(animeData[0].title,
            style: Theme.of(context).primaryTextTheme.headline5));
  }

  Hero frontImageBanner(context) {
    return Hero(
      tag: _argumnets['id'],
      flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) =>
          Material(child: toHeroContext.widget),
      child: Container(
        height: 450,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: 450,
                child: Image.network(animeData[0].coverImg, fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 0.5),
                Color.fromRGBO(12, 20, 43, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            )),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.28),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
