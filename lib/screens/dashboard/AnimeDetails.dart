import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeModels.dart';
import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';

class AnimeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    final AnimeModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: scWidth,
              height: 350,
              child: Stack(
                children: [
                  ImageOrNetWork(
                    id: data.id,
                    url: data.coverImg,
                    fit: BoxFit.cover,
                    width: scWidth,
                    height: 347,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.0001),
                          Color.fromRGBO(255, 255, 255, 0.0001),
                          Theme.of(context).scaffoldBackgroundColor
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data.title,
                        style: Theme.of(context).textTheme.headline3,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScoreItem(value: data.averageScore, caption: "AVG Score"),
                  ScoreItem(value: data.popularity, caption: "Popularity"),
                  ScoreItem(value: data.duration, caption: "Duration(min)"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Description",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(data.description),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 8,
                    children: [
                      TextRow(
                        title: "Type : ",
                        value: data.type,
                      ),
                      TextRow(title: "Season : ", value: data.season),
                      TextRow(title: "Status : ", value: data.status),
                      TextRow(
                          title: "Season Year : ",
                          value: data.seasonYear.toString()),
                      TextRow(title: "Writer : ", value: ""),
                      TextRow(title: "Studio : ", value: data.status),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    "Tags : ",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    height: 20,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.tags != null ? data.tags.length : 0,
                      itemBuilder: (ctx, index) {
                        return Text(data.tags[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: Text(
                "Availability",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    elevation: 0.0,
                    onPressed: () {},
                    child: Text("Stream Episod"),
                  ),
                  RaisedButton(
                    elevation: 0.0,
                    onPressed: () {},
                    child: Text("Download"),
                  ),
                  RaisedButton(
                    elevation: 0.0,
                    onPressed: () {},
                    child: Text("Torrent"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    Key key,
    @required this.title,
    this.value,
  }) : super(key: key);

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          value,
        ),
      ],
    );
  }
}

class ScoreItem extends StatelessWidget {
  const ScoreItem({
    Key key,
    @required this.value,
    this.caption,
  }) : super(key: key);

  final int value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          caption,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ));
  }
}
