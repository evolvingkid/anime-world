import 'package:animeworld/core/getx/animesState.dart';
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

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      //bottom
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        print("bottom");
        int _skip = animeState.animeFilter.length;
        animeState.fetchDataFromServers(
          title: searchString,
          skip: _skip.toString(),
          limit: '20',
        );
      }
      //top
      if (controller.offset <= controller.position.minScrollExtent &&
          !controller.position.outOfRange) {
        print("top");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      bottomNavigationBar: Obx(
        () => animeState.isloading.value
            ? Container(
                padding: EdgeInsets.all(15),
                child: LinearProgressIndicator(
                  backgroundColor: Theme.of(context).buttonColor,
                ))
            : Container(
                height: 0,
              ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Obx(
          () => GridView.builder(
              controller: controller,
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
