import 'package:flutter/material.dart';

TextTheme accentTextTheme() => TextTheme(
      //! text color may be white as default
      headline6: TextStyle(
          fontFamily: 'QuattrocentoSans', fontWeight: FontWeight.w800),
      bodyText1: TextStyle(fontFamily: 'QuattrocentoSans'),
      bodyText2: TextStyle(fontFamily: 'QuattrocentoSans', color: Colors.black),
    );
