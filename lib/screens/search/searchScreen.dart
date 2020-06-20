import 'package:animeworld/Provider/animeSearch.dart';
import 'package:animeworld/screens/seeAllScreen/seeAllScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/searchScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff064C74),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for Anime',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  Provider.of<AnimeSearch>(context, listen: false)
                      .fetchDataFromServer(title: value);
                },
              ),
            ),
            Expanded(
              child: Consumer<AnimeSearch>(
                builder: (ctx, animeData, _) => Container(
                  child: ViewingGrid(
                      argumnets: 'search',
                      animeData: animeData.animeSearchData),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
