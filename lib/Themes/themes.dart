  import 'package:flutter/material.dart';

ThemeData themeData() {
    return ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xff136492),
        buttonColor: Color(0xff136492),
        scaffoldBackgroundColor: Color(0xff0C142B),
        cardColor: Color(0xff065061),
        backgroundColor: Color(0xff242C3F),
        iconTheme: IconThemeData(color: Colors.white),
        primaryTextTheme: TextTheme(
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Color(0xffC5BABA)),
            headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            bodyText1:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
  }