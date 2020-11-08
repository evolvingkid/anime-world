import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeModels.dart';
import 'package:flutter/material.dart';

class AnimeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AnimeModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  ImageOrNetWork(
                    url: data.coverImg,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
