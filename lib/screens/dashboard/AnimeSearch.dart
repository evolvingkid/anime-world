import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AnimeSearch extends StatelessWidget {
  final AnimeState animeState = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (val) {
            animeState.filterData(searchTitle: val);
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Search Animes",
            suffixIcon: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Obx(
          () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: animeState.animeFilter.length,
              itemBuilder: (ctx, index) {
                return animeState.animeFilter.length > 0
                    ? AnimeItem(data: animeState.animeFilter[index])
                    : Container(
                        child: Text('No Data Found'),
                      );
              }),
        ),
      ),
    );
  }
}
