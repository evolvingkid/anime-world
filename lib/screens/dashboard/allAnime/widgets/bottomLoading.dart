import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomLoading extends StatelessWidget {
  final AnimeState animeState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => animeState.isloading.value
        ? Container(
            padding: EdgeInsets.all(15),
            child: LinearProgressIndicator(
                backgroundColor: Theme.of(context).buttonColor))
        : const SizedBox());
  }
}
