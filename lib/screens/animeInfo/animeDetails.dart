import 'package:animeworld/Provider/animeMovies.dart';
import 'package:animeworld/Provider/animeOVA.dart';
import 'package:animeworld/Provider/animeSearch.dart';
import 'package:animeworld/Provider/animeSeries.dart';
import 'package:animeworld/Provider/animeTorrent.dart';
import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/widgets/animeDetailsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modalSheetBody.dart';
import '../../global/descDataFormactor.dart' as global;

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
    decription = global.descDataFormactor(animeData[0].description);
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
                  AnimeDetailsWidegts(
                      screenWidth: screenWidth,
                      decription: decription,
                      animeData: animeData[0]),
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

  Text headingTxt(BuildContext context) {
    return Text(animeData[0].title,
        style: Theme.of(context).primaryTextTheme.headline5);
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
