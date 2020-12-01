import 'package:animeworld/core/models/animeWorldModel.dart';
import 'package:flutter/material.dart';
import 'stramItems.dart';

class AvalibilityBottomBar extends StatelessWidget {
  final AnimeModels animeData;
  AvalibilityBottomBar({@required this.animeData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: dataChecker(
      showDataWidgets: animedataShower(),
      noDataNotifierWidget: nodataShower(),
    ));
  }

  Container nodataShower() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "No download data available for this anime",
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  ListView animedataShower() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 35),
        physics: NeverScrollableScrollPhysics(),
        itemCount: animeData.streamingData.length,
        itemBuilder: (ctx, index) {
          return StreamItem(data: animeData.streamingData[index]);
        });
  }

  Widget dataChecker({Widget showDataWidgets, Widget noDataNotifierWidget}) {
    return animeData.streamingData.length > 0
        ? showDataWidgets
        : noDataNotifierWidget;
  }
}
