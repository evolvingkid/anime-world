import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWorldModel.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/material.dart';

class StreamItem extends StatelessWidget {
  StreamItem({this.data});
  final URLLaunchServices _urlLaunchServices = locator<URLLaunchServices>();

  final StreamingModels data;

  void _launchURL(String url) async {
    await _urlLaunchServices
        .launchURL(url)
        .catchError((e) => debugPrint(e.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(data.url),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            imageTitle(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titile(),
                      subTitle(context),
                    ],
                  )),
            ),
            Icon(Icons.open_in_browser_rounded)
          ],
        ),
      ),
    );
  }

  Text subTitle(BuildContext context) {
    return Text(
      data.site,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .caption
          .merge(TextStyle(fontStyle: FontStyle.italic)),
    );
  }

  Text titile() {
    return Text(
      data.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  ClipRRect imageTitle() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageOrNetWork(
        url: data.tumbline,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
