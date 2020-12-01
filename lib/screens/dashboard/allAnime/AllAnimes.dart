import 'package:animeworld/core/getx/animesState.dart';
import 'package:animeworld/widgets/AnimeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'widgets/bottomLoading.dart';

class AllAnimes extends StatefulWidget {
  @override
  _AllAnimesState createState() => _AllAnimesState();
}

class _AllAnimesState extends State<AllAnimes> {
  AnimeState animeState = Get.find();
  ScrollController controller = ScrollController();
  String data;
  bool _isInt = true;

  void scrollController() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      int _skip = animeState.animeFilter.length;
      animeState.fetchDataFromServers(
        itemType: data,
        skip: _skip.toString(),
        limit: '20',
      );
    }
    //top
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {}
  }

// ? for chceking that data is minium of 15 and if not loading more data
  void minCheckLoading(int dataLength) {
    if (dataLength < 15) {
      animeState.fetchDataFromServers(
          itemType: data, limit: "20", skip: dataLength.toString());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInt) {
      _isInt = false;
      data = ModalRoute.of(context).settings.arguments;
      animeState.filterData(animeType: data);
      controller.addListener(scrollController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data)),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Obx(
          () => GridView.builder(
              controller: controller,
              gridDelegate: customGridDelegate(),
              itemCount: animeState.animeFilter.length,
              itemBuilder: (ctx, index) {
                minCheckLoading(animeState.animeFilter.length);
                return animesLoadingConfigs(
                  data: animeState.animeFilter[index],
                  dataLength: animeState.animeFilter.length,
                );
              }),
        ),
      ),
      bottomNavigationBar: BottomLoading(),
    );
  }

  Widget animesLoadingConfigs({@required int dataLength, @required data}) {
    return dataLength > 0
        ? AnimeItem(data: data)
        : Container(child: Text('No Data Found'));
  }
}

SliverGridDelegateWithFixedCrossAxisCount customGridDelegate() {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 10,
    childAspectRatio: 0.8,
  );
}
