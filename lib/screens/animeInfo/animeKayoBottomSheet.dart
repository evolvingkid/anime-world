import 'package:animeworld/global/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Container animeKayoBottomModelSheetBody(context, animeData) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      title: Text(
        'Anime Kayo',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {
                share(context, animeData[0].avalibility[0]['animesData']['link'], animeData[0].avalibility[0]['animesData']['link']);
              }),
          FlatButton(
              onPressed: () {
                launch(animeData[0].avalibility[0]['animesData']['link']);
              },
              child: Text('Visit', style: TextStyle(color: Colors.white)))
        ],
      ),
    ),
  );
}
