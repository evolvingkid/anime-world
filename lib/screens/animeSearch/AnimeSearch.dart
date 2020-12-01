import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/screens/dashboard/allAnime/AllAnimes.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AnimeSearch extends StatefulWidget {
  @override
  _AnimeSearchState createState() => _AnimeSearchState();
}

class _AnimeSearchState extends State<AnimeSearch> {
  final AnimeState animeState = Get.find();
  String searchString = "";
  ScrollController controller = ScrollController();

  void scrollListenController() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      int _skip = animeState.animeFilter.length;
      animeState.fetchDataFromServers(
        title: searchString,
        skip: _skip.toString(),
        limit: '20',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListenController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppbar(),
      body: Obx(
        () => GridView.builder(
            padding: EdgeInsets.only(left: 10, top: 10),
            controller: controller,
            gridDelegate: customGridDelegate(),
            itemCount: animeState.animeFilter.length,
            itemBuilder: (ctx, index) {
              return animeState.animeFilter.length > 0
                  ? AnimeItem(data: animeState.animeFilter[index])
                  : Container(child: Text('No Data Found'));
            }),
      ),
      bottomNavigationBar: Obx(
        () => animeState.isloading.value
            ? Container(
                padding: EdgeInsets.all(15),
                child: LinearProgressIndicator(
                    backgroundColor: Theme.of(context).buttonColor))
            : const SizedBox(),
      ),
    );
  }

  AppBar searchAppbar() {
    return AppBar(
      title: TextField(
        onChanged: (val) {
          searchString = val;
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
    );
  }
}
