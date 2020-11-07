import 'package:animeworld/core/getx/animeWorldStates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final animesState = Get.put(AnimeState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text('data'),
    ));
  }
}
