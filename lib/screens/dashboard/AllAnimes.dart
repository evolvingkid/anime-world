import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllAnimes extends StatelessWidget {
  final AnimeState animeState = Get.find();
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("All"),
      ),
      bottomNavigationBar: animeState.isloading.value
          ? Container(
              padding: EdgeInsets.all(15),
              child: LinearProgressIndicator(
                backgroundColor: Theme.of(context).buttonColor,
              ))
          : Container(
              height: 0,
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
              itemCount: animeState.ovaAnime.length,
              itemBuilder: (ctx, index) {
                if (animeState.ovaAnime.length < 15) {
                  print("asd");
                  animeState.fetchDataFromServers(
                      itemType: data,
                      limit: "15",
                      skip: animeState.ovaAnime.length.toString());
                }
                return animeState.ovaAnime.length > 0
                    ? AnimeItem(data: animeState.ovaAnime[index])
                    : Container(
                        child: Text('No Data Found'),
                      );
              }),
        ),
      ),
    );
  }
}
