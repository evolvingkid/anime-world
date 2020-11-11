import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AllAnimes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Search",
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
