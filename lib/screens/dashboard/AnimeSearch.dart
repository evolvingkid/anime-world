import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AnimeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Search Animes",
            suffixIcon: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
