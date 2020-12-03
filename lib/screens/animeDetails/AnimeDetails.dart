import 'package:admob_flutter/admob_flutter.dart';
import 'package:animeworld/core/ads/ad_manager.dart';
import 'package:animeworld/core/models/animeModels.dart';
import 'package:flutter/material.dart';
import 'widgets/Top_bar.dart';
import 'widgets/avalibilityContent.dart';
import 'widgets/avalibility_bottom_bar.dart';
import 'widgets/scroe_item.dart';
import 'widgets/text_row.dart';

class AnimeDetails extends StatelessWidget {
  void showStreamEpisode({BuildContext context, AnimeModels data}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (ctx) => AvalibilityBottomBar(animeData: data));
  }

  void onStreamingpressed({AnimeModels animeData, BuildContext context}) {
    showStreamEpisode(
      context: context,
      data: animeData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AnimeModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackButton(),
      body: ListView(
        children: [
          TopBar(data: data),
          const SizedBox(height: 10),
          scoreBoard(data),
          AdmobBanner(
              adUnitId: AdManager.bannerAdUnitId,
              adSize: AdmobBannerSize.BANNER),
          const SizedBox(height: 10),
          descTitle(context),
          desc(data),
          statitcs(data),
          tags(context, data),
          avalibilityTitle(context),
          AvalibilityContent(
            data: data,
            onStreamingPressed: (val) =>
                onStreamingpressed(context: context, animeData: val),
          ),
          AdmobBanner(
              adUnitId: AdManager.bannerAdUnitId,
              adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
        ],
      ),
    );
  }

  Padding avalibilityTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Text("Availability", style: Theme.of(context).textTheme.headline6),
    );
  }

  Padding tags(BuildContext context, AnimeModels data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        children: [
          Text("Tags : ", style: Theme.of(context).textTheme.headline6),
          Container(
            height: 20,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.tags != null ? data.tags.length : 0,
                itemBuilder: (ctx, index) => Text(data.tags[index])),
          )
        ],
      ),
    );
  }

  Padding statitcs(AnimeModels data) {
    var differentStatitics = [
      TextRow(title: "Type : ", value: data.type),
      TextRow(title: "Season : ", value: data.season),
      TextRow(title: "Status : ", value: data.status),
      TextRow(title: "Season Year : ", value: data.seasonYear.toString()),
      TextRow(title: "Writer : ", value: ""),
      TextRow(title: "Studio : ", value: data.status),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 8,
            children: differentStatitics,
          )
        ],
      ),
    );
  }

  Padding desc(AnimeModels data) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Text(data.description),
    );
  }

  Padding descTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text("Description", style: Theme.of(context).textTheme.headline6),
    );
  }

  Padding scoreBoard(AnimeModels data) {
    var differentScores = [
      ScoreItem(value: data.averageScore, caption: "AVG Score"),
      ScoreItem(value: data.popularity, caption: "Popularity"),
      ScoreItem(value: data.duration, caption: "Duration(min)"),
    ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: differentScores),
    );
  }
}
