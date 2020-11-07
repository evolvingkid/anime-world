import 'package:flutter/material.dart';

Color bgDark = Color(0xff242C3F);
Color dark = Color(0xff191C24);

TextTheme accentTextTheme() => TextTheme(
      //! text color may be white as default
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans', fontWeight: FontWeight.w800),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans'),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.black),
    );

TextTheme textTheme() => TextTheme(
      //! text color may be white as default
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans', fontWeight: FontWeight.w800),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans'),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans'),
    );

TextTheme darkTextTheme() => TextTheme(
      //! text color may be white as default
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans',
          fontWeight: FontWeight.w800,
          color: Colors.white),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
      subtitle2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
    );
