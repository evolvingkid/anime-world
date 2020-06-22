import 'package:animeworld/Provider/latestAnimes.dart';
import 'package:animeworld/models/animeCore.dart';
import 'package:animeworld/widgets/animeDetailsWidgets.dart';
import 'package:animeworld/widgets/mainBanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';
import '../../global/descDataFormactor.dart' as global;

class TabletModeAnimeBanner extends StatelessWidget {
  const TabletModeAnimeBanner({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      padding: EdgeInsets.all(10),
      child: Consumer<LatestAnimes>(
          builder: (ctx, latestAnimeData, _) =>
              latestAnimeData.homeScreenLoading
                  ? CustomSkimmer()
                  : Column(
                      children: <Widget>[
                        BannerContainer(
                            bannerList: latestAnimeData.latestAnimeData,
                            width: screenWidth * 0.5),
                        const SizedBox(height: 20),
                        ShowMoreAnime(dataIndex: latestAnimeData.latestAnime)
                      ],
                    )),
    );
  }
}

class ShowMoreAnime extends StatelessWidget {
  final int dataIndex;
  ShowMoreAnime({@required this.dataIndex});

  AnimeCore data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<LatestAnimes>(context, listen: false)
        .latestAnimeData[dataIndex];
    String decription = global.descDataFormactor(data.description);
    var screenWidth = MediaQuery.of(context).size.width;
    return AnimeDetailsWidegts(
        screenWidth: screenWidth * 0.4,
        decription: decription,
        animeData: data);
  }
}
