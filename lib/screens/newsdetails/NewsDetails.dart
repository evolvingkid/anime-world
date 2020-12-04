import 'package:admob_flutter/admob_flutter.dart';
import 'package:animeworld/core/ads/ad_manager.dart';
import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:animeworld/screens/newsdetails/widgets/imagePostion.dart';
import 'package:flutter/material.dart';

import 'widgets/backBtn.dart';

class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    final AnimeNewsModel data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackBtn(),
      body: ListView(
        children: [
          ImagePostions(scWidth: scWidth, data: data),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(data.description)),
        AdmobBanner(adUnitId: AdManager.viewnewsBanner, adSize: AdmobBannerSize.LARGE_BANNER),

          Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Text("${data.content}")),
        AdmobBanner(adUnitId: AdManager.viewnewsSquareBanner, adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
        ],
      ),
    );
  }
}
