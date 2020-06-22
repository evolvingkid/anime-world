import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/screens/animeInfo/animeDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerContainer extends StatefulWidget {
  final List<dynamic> bannerList;
  final double width;

  BannerContainer({@required this.bannerList, @required this.width});

  @override
  _BannerContainerState createState() => _BannerContainerState();
}

class _BannerContainerState extends State<BannerContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      Provider.of<LatestAnimes>(context, listen: false)
          .changeLatestAnime(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: widget.width,
      child: DefaultTabController(
          length: 5,
          child: TabBarView(
            children: [
              BannerViewersList(data: widget.bannerList[0]),
              BannerViewersList(data: widget.bannerList[1]),
              BannerViewersList(data: widget.bannerList[2]),
              BannerViewersList(data: widget.bannerList[3]),
              BannerViewersList(data: widget.bannerList[4]),
            ],
            controller: _tabController,
          )),
    );
  }
}

class BannerViewersList extends StatelessWidget {
  final data;
  BannerViewersList({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Map _arguments = {'type': 'animeLatest', 'id': data.id};
          Navigator.of(context)
              .pushNamed(AnimeDetails.routeName, arguments: _arguments);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: data.coverImg != null || data.bannerImg != null
                      ? Image.network(
                          data.bannerImg == null
                              ? data.coverImg
                              : data.bannerImg,
                          fit: BoxFit.cover,
                        )
                      : Center(child: Text('No Image Found')),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.46),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Text(
                    data.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
