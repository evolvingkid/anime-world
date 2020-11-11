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
        child: GetX<AnimeState>(
          builder: (_controller) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: _controller.animeFilter.length,
              itemBuilder: (ctx, index) {
                print("index");
                return _controller.ongoingAnime.length > 0
                    ? Container(
                        child: AnimeItem(data: _controller.animeFilter[index]),
                        height: 183,
                      )
                    : Container(
                        child: Text('No Data Found'),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
