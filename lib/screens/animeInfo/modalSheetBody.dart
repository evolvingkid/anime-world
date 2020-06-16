import 'package:animeworld/Provider/animeTorrent.dart';
import 'package:animeworld/global/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:provider/provider.dart';
import 'animeKayoBottomSheet.dart';
import 'modalSheetInnerBody.dart';

Container modelSheetBody(BuildContext context, String type, animeData,
    screenHeight, GlobalKey<ScaffoldState> key) {
  return Container(
      height: screenHeight * 0.5,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  type,
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
          type == 'Streaming'
              ? modelSheetInnerBody(context, animeData)
              : type == 'Anime Kayo'
                  ? animeKayoBottomModelSheetBody(context, animeData)
                  : AnimeTorrentBottomModelSheetBody(key),
        ],
      ));
}

class AnimeTorrentBottomModelSheetBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  AnimeTorrentBottomModelSheetBody(this.scaffoldkey);
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimeTorrent>(
      builder: (ctx, animeData, _) => animeData.isTorrent
          ? Center(child: CircularProgressIndicator())
          : animeData.animeTorrentData.length == 0
              ? Text('No data Found from torrent')
              : Expanded(
                  child: ListView.builder(
                    itemCount: animeData.animeTorrentData.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(
                          animeData.animeTorrentData[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                            animeData.animeTorrentData[index].videoQuality,
                            style: TextStyle(color: Colors.white54)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.share, color: Colors.white),
                                onPressed: () {
                                  share(
                                      context,
                                      animeData.animeTorrentData[index].link,
                                      animeData.animeTorrentData[index].link);
                                }),
                            FlatButton(
                                onPressed: () {
                                  FlutterClipboardManager.copyToClipBoard(
                                          animeData
                                              .animeTorrentData[index].link)
                                      .then((result) {
                                    scaffoldkey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text('Link Copied'),
                                      duration: Duration(seconds: 3),
                                    ));

                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text('Copy',
                                    style: TextStyle(color: Colors.white)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
