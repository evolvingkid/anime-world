import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/screens/dashboard/AnimeDetails.dart';
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
      body: GetX<AnimeState>(
        builder: (_controller) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              if (_controller.animeFilter.length > 0) {
                return AnimeItem(data: _controller.animeFilter[index]);
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
