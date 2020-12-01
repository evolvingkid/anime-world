import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/NewsItemTile.dart';
import 'package:animeworld/widgets/listViewShimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeNewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GetX<AnimeNews>(builder: (controller) {
      return controller.isLoading.value
          ? loadingScreen(screenWidth)
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.animeNewsMini.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsItemTile(
                    scWidth: screenWidth,
                    data: controller.animeNewsData[index]);
              },
            );
    });
  }

  Column loadingScreen(double screenWidth) {
    return Column(
      children: [
        Center(child: ListViewShinner(width: screenWidth * 0.6)),
      ],
    );
  }
}
