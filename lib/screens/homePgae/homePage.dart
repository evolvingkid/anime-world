import 'package:animeworld/Provider/animeMovies.dart';
import 'package:animeworld/Provider/animeOVA.dart';
import 'package:animeworld/Provider/animeSeries.dart';
import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/models/animeCore.dart';
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
  bool _isLoading = true;
  bool _isConnected = true;
  String _errorMsg;
  List<AnimeCore> _latestAnimeData;
  List<AnimeCore> _animeSeries;
  List<AnimeCore> _animeMovies;
  List<AnimeCore> _animeOVA;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AppUpdateInfo _updateInfo;

  pageReload() {
    setState(() {
      _isLoading = true;
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
        await Provider.of<LatestAnimes>(context, listen: false)
            .fetchDataFromServer();
        _latestAnimeData =
            Provider.of<LatestAnimes>(context, listen: false).latestAnimeData;
        await Provider.of<AnimeSeries>(context, listen: false)
            .fetchDataFromServer();
        _animeSeries =
            Provider.of<AnimeSeries>(context, listen: false).animeSeries;
        await Provider.of<AnimeMovies>(context, listen: false)
            .fetchDataFromServer();
        _animeMovies =
            Provider.of<AnimeMovies>(context, listen: false).animeMovies;
        await Provider.of<AnimeOVA>(context, listen: false)
            .fetchDataFromServer();
        _animeOVA = Provider.of<AnimeOVA>(context, listen: false).animeOVA;
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
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      //* update info
      setState(() {
        _updateInfo = info;
      });

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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
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
                        BannerContainer(bannerList: _latestAnimeData),
                        const SizedBox(
                          height: 30,
                        ),
                        // *latest anime slide build
                        AnimeSlideBanner(
                          headingText: 'Series',
                          onPressHeadingFunction: () {
                            Navigator.of(context).pushNamed(
                                SeeAllScreen.routeName,
                                arguments: 'Series');
                          },
                          listOfdata: _animeSeries,
                          animeType: 'Series',
                        ),
                        AnimeSlideBanner(
                          headingText: 'Movies',
                          onPressHeadingFunction: () {
                            Navigator.of(context).pushNamed(
                                SeeAllScreen.routeName,
                                arguments: 'Movies');
                          },
                          animeType: 'Movies',
                          listOfdata: _animeMovies,
                        ),
                        AnimeSlideBanner(
                          headingText: 'OVA',
                          onPressHeadingFunction: () {
                            Navigator.of(context).pushNamed(
                                SeeAllScreen.routeName,
                                arguments: 'OVA');
                          },
                          animeType: 'OVA',
                          listOfdata: _animeOVA,
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
