import 'package:animeworld/screens/animeInfo/animeDetails.dart';
import 'package:flutter/material.dart';

class BannerContainer extends StatelessWidget {
  final List<dynamic> bannerList;

  BannerContainer({@required this.bannerList});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return InkWell(
              onTap: () {
                Map _arguments = {
                  'type': 'animeLatest',
                  'id': bannerList[index].id
                };
                Navigator.of(context)
                    .pushNamed(AnimeDetails.routeName, arguments: _arguments);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: bannerVeiwerStack(index),
              ),
            );
          }),
    );
  }

  Stack bannerVeiwerStack(int index) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: bannerList[index].coverImg != null ||
                    bannerList[index].bannerImg != null
                ? Image.network(
                    bannerList[index].bannerImg == null
                        ? bannerList[index].coverImg
                        : bannerList[index].bannerImg,
                    fit: BoxFit.cover,
                  )
                : Center(child: Text('No Image Found')),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(14),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.46),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            child: Text(
              bannerList[index].title,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        )
      ],
    );
  }
}
