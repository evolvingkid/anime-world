import 'package:flutter/material.dart';

Color bgDark = Color(0xff242C3F);
Color dark = Color(0xff191C24);
Color secondary = Color(0xff0F9AE9);
Color secondaryDark = Color(0xff0F9AE9);

TextTheme accentTextTheme() => TextTheme(
      //! text color may be white as default
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans', fontWeight: FontWeight.w800),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans'),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.black),
    );

TextTheme textTheme() => TextTheme(
      //! text color may be white as default

      headline5: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
      headline4: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        fontSize: 18,
        color: dark,
      ),
      headline3: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        fontSize: 22,
        color: dark,
      ),
      headline6: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w900,
        fontSize: 14,
      ),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans'),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans'),
      caption: TextStyle(fontFamily: 'QuattrocentoSans', fontSize: 10),
      subtitle2: TextStyle(fontFamily: 'QuattrocentoSans'),
      button: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
    );

TextTheme darkTextTheme() => TextTheme(
      //! text color may be white as default

      headline5: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 16,
      ),
      headline4: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 18,
      ),
      headline3: TextStyle(
        fontFamily: 'QuattrocentoSans',
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 22,
      ),
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans',
          fontWeight: FontWeight.w900,
          fontSize: 14,
          color: Colors.white),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
      subtitle2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
      caption: TextStyle(
          fontFamily: 'QuattrocentoSans', fontSize: 10, color: Colors.white),
      button: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.white),
    );

TextStyle white14 = new TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontFamily: 'QuattrocentoSans',
);
