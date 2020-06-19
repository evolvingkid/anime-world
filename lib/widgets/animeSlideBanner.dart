import 'package:animeworld/screens/animeInfo/animeDetails.dart';
import 'package:flutter/material.dart';

class AnimeSlideBanner extends StatelessWidget {
  final String headingText;
  final Function onPressHeadingFunction;
  final List<dynamic> listOfdata;
  final String animeType;

  AnimeSlideBanner(
      {@required this.headingText,
      @required this.onPressHeadingFunction,
      @required this.listOfdata,
      this.animeType});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              headingText,
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            FlatButton(
                onPressed: onPressHeadingFunction,
                child: Text('See More'),
                textColor: Colors.white,
                color: Color(0xff0896B6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: screenWidth,
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listOfdata.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return InkWell(
                  onTap: () {
                    Map _arguments = {
                      'type': animeType,
                      'id': listOfdata[index].id
                    };
                    Navigator.of(context).pushNamed(AnimeDetails.routeName,
                        arguments: _arguments);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 142,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                tag: listOfdata[index].id,
                                child: Image.network(
                                  listOfdata[index].coverImg,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.46),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Text(
                              listOfdata[index].title,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
