import 'package:animeworld/Provider/animeMovies.dart';
import 'package:animeworld/Provider/animeOVA.dart';
import 'package:animeworld/Provider/animeSeries.dart';
import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/screens/search/searchScreen.dart';
import 'package:animeworld/screens/seeAllScreen/seeAllScreen.dart';
import 'package:animeworld/widgets/animeSlideBanner.dart';
import 'package:animeworld/widgets/errorMsg.dart';
import 'package:animeworld/widgets/mainBanner.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isConnected = true;
  String _errorMsg;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  pageReload() {
    setState(() {
      _isConnected = true;
    });
    dataCollection();
  }

  Future<void> dataCollection() async {
    // check data connection
    bool _isConnection = await DataConnectionChecker().hasConnection;
    if (_isConnection) {
      try {
        // * where all the data area fetched
        Provider.of<LatestAnimes>(context, listen: false).fetchDataFromServer();

        Provider.of<AnimeSeries>(context, listen: false).fetchDataFromServer();

        Provider.of<AnimeMovies>(context, listen: false).fetchDataFromServer();

        Provider.of<AnimeOVA>(context, listen: false).fetchDataFromServer();
      } catch (e) {
        print(e);
        setState(() {
          _errorMsg = "Server error occured";
          _isConnected = false;
        });
      }
    } else {
      setState(() {
        _errorMsg = "Check Your Internet Connection";
        _isConnected = false;
      });
    }
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      // * start background update
      InAppUpdate.startFlexibleUpdate().then((_) {
        // *install update
        InAppUpdate.completeFlexibleUpdate().then((_) {
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('App has been updated!')));
        }).catchError((e) => print('object'));
      }).catchError((e) => print('object'));
    }).catchError((e) => print('object'));
  }

  @override
  void didChangeDependencies() {
    dataCollection();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected) {
      return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  CustomAppBar(
                    appBarName: 'Anime world',
                    isBackButton: false,
                    istraling: true,
                    traling: <Widget>[
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SearchScreen.routeName);
                          })
                    ],
                  ),
                  const SizedBox(height: 30),
                  //* adding banner anime
                  Consumer<LatestAnimes>(
                      builder: (ctx, latestAnimeData, _) =>
                          latestAnimeData.homeScreenLoading
                              ? CustomSkimmer()
                              : BannerContainer(
                                  bannerList: latestAnimeData.latestAnimeData)),
                  const SizedBox(
                    height: 30,
                  ),
                  // * anime series
                  Consumer<AnimeSeries>(
                    builder: (ctx, animeSeries, _) =>
                        animeSeries.isHomeScreenLoading
                            ? CustomSkimmer()
                            : AnimeSlideBanner(
                                headingText: 'Series',
                                onPressHeadingFunction: () {
                                  Navigator.of(context).pushNamed(
                                      SeeAllScreen.routeName,
                                      arguments: 'Series');
                                },
                                listOfdata: animeSeries.animeSeries,
                                animeType: 'Series',
                              ),
                  ),
                  // * anime moives
                  Consumer<AnimeMovies>(
                    builder: (ctx, animeMovies, _) =>
                        animeMovies.isHomePageLoading
                            ? CustomSkimmer()
                            : AnimeSlideBanner(
                                headingText: 'Movies',
                                onPressHeadingFunction: () {
                                  Navigator.of(context).pushNamed(
                                      SeeAllScreen.routeName,
                                      arguments: 'Movies');
                                },
                                animeType: 'Movies',
                                listOfdata: animeMovies.animeMovies,
                              ),
                  ),
                  // * anime OVA
                  Consumer<AnimeOVA>(
                    builder: (ctx, animeOVA, _) => animeOVA.isHomePageLoading
                        ? CustomSkimmer()
                        : AnimeSlideBanner(
                            headingText: 'OVA',
                            onPressHeadingFunction: () {
                              Navigator.of(context).pushNamed(
                                  SeeAllScreen.routeName,
                                  arguments: 'OVA');
                            },
                            animeType: 'OVA',
                            listOfdata: animeOVA.animeOVA,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return ErrorMessageShower(
        errorMsg: _errorMsg, onPressedFunction: pageReload);
  }

  Column headingText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Anime World',
            style: Theme.of(context).primaryTextTheme.headline4),
        Text('explore world of anime',
            style: Theme.of(context).primaryTextTheme.bodyText1),
      ],
    );
  }
}

class CustomSkimmer extends StatelessWidget {
  const CustomSkimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        child: Image.asset('assets/images/skimmer.png', fit: BoxFit.cover));
  }
}
