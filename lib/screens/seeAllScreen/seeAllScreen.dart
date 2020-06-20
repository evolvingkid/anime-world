import 'package:animeworld/Provider/animeMovies.dart';
import 'package:animeworld/Provider/animeOVA.dart';
import 'package:animeworld/Provider/animeSeries.dart';
import 'package:animeworld/screens/animeInfo/animeDetails.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllScreen extends StatefulWidget {
  static const routeName = './seeAllScreen';

  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  String _argumnets;
  ScrollController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> _fetchData() async {
    bool _isConnection = await DataConnectionChecker().hasConnection;
    if (_isConnection) {
      if (_argumnets == 'Series') {
        await Provider.of<AnimeSeries>(context, listen: false)
            .fetchDataFromServerPagination();
        return;
      }
      if (_argumnets == 'Movies') {
        await Provider.of<AnimeMovies>(context, listen: false)
            .fetchDataFromServerPagination();
        return;
      }
      if (_argumnets == 'OVA') {
        await Provider.of<AnimeOVA>(context, listen: false)
            .fetchDataFromServerPagination();
        return;
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Check your internet connecttion'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _fetchData();
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _argumnets = ModalRoute.of(context).settings.arguments;
    if (_argumnets == 'Series') {
      _fetchData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
            child: Container(
          height: screenHeight,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              CustomAppBar(appBarName: _argumnets),
              const SizedBox(height: 20),
              _argumnets == 'Series'
                  ? Expanded(
                      child: Consumer<AnimeSeries>(
                        builder: (ctx, animeData, _) => Container(
                          child: ViewingGrid(
                              controllers: _controller,
                              argumnets: _argumnets,
                              animeData: animeData.animeSeries),
                        ),
                      ),
                    )
                  : _argumnets == 'Movies'
                      ? Expanded(
                          child: Consumer<AnimeMovies>(
                            builder: (ctx, animeData, _) => Container(
                              child: ViewingGrid(
                                  controllers: _controller,
                                  argumnets: _argumnets,
                                  animeData: animeData.animeMovies),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Consumer<AnimeOVA>(
                            builder: (ctx, animeData, _) => Container(
                              child: ViewingGrid(
                                  controllers: _controller,
                                  argumnets: _argumnets,
                                  animeData: animeData.animeOVA),
                            ),
                          ),
                        )
            ],
          ),
        )));
  }
}

class ViewingGrid extends StatelessWidget {
  final controllers;
  final String argumnets;
  final animeData;

  ViewingGrid({this.controllers, this.argumnets, this.animeData});

  @override
  Widget build(BuildContext context) {
    return animeData.length <= 0
        ? Center(child: Text('No data', style: TextStyle(color: Colors.white)))
        : GridView.builder(
            controller: controllers,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2 / 3),
            itemCount: animeData.length + 1,
            itemBuilder: (context, index) {
              if (animeData.length == index) {
                return Container(
                    height: 400,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Center(child: CircularProgressIndicator()));
              }

              return InkWell(
                onTap: () {
                  Map _arguments = {
                    'type': argumnets,
                    'id': animeData[index].id
                  };
                  Navigator.of(context)
                      .pushNamed(AnimeDetails.routeName, arguments: _arguments);
                },
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff064C74)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Hero(
                            tag: animeData[index].id,
                            child: Image.network(
                              animeData[index].coverImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                      Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff064C74),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            animeData[index].title,
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            });
  }
}

class CustomAppBar extends StatelessWidget {
  final String appBarName;
  final bool isBackButton;
  final bool istraling;
  final List<Widget> traling;

  CustomAppBar(
      {@required this.appBarName,
      this.isBackButton = true,
      this.istraling = false,
      this.traling});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xff064C74), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                isBackButton
                    ? IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                    : SizedBox(),
                Text(appBarName,
                    style: Theme.of(context).primaryTextTheme.headline6,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          istraling ? Row(children: traling) : SizedBox()
        ],
      ),
    );
  }
}
