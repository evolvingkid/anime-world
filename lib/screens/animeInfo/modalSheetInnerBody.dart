import 'package:animeworld/global/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Expanded modelSheetInnerBody(ctx, animeData) {
  dynamic streamData = animeData[0].streamEpisode;
  return Expanded(
      child: Container(
    child: ListView.builder(
        itemCount: streamData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                streamData[index]['title'],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Site: ${streamData[index]['site']}',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: () { share(ctx, streamData[index]['url'], streamData[index]['url']);}),
                  FlatButton(
                      onPressed: () {
                        launch(streamData[index]['url']);
                      },
                      child:
                          Text('Visit', style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
          );
        }),
  ));
}
