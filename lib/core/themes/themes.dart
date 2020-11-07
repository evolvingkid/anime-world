import 'package:flutter/material.dart';
import 'textThemes/textTheme.dart';

ThemeData themes() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffF6F9FF),
    appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
    accentColor: Color(0xff191C24),
    textTheme: textTheme(),
    accentTextTheme: accentTextTheme(),
  );
}

ThemeData darkThemes() {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
    appBarTheme: AppBarTheme(color: bgDark, elevation: 0),
    textTheme: darkTextTheme(),
    scaffoldBackgroundColor: bgDark,
    accentColor: Color(0xff191C24),
    accentTextTheme: accentTextTheme(),
  );
}
