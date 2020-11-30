import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:animeworld/widgets/NewsItemTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeNewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GetX<AnimeNews>(builder: (controller) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.animeNewsMini.length,
        itemBuilder: (BuildContext context, int index) {
          return controller.isLoading.value
              ? const SizedBox()
              : NewsItemTile(
                  scWidth: screenWidth,
                  data: controller.animeNewsData[index],
                );
        },
      );
    });
  }
}
