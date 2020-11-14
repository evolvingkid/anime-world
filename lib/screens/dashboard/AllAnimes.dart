import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllAnimes extends StatelessWidget {
  AnimeState animeState = Get.find();
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context).settings.arguments;
    animeState.filterData(animeType: data);
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
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
                if (animeState.animeFilter.length < 15) {
                  animeState.fetchDataFromServers(
                      itemType: data,
                      limit: "15",
                      skip: animeState.animeFilter.length.toString());
                }
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
