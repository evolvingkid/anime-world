import 'package:flutter/material.dart';
import 'textThemes/textTheme.dart';

ThemeData themes() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffF6F9FF),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: dark),
        elevation: 0),
    accentColor: Color(0xff191C24),
    buttonTheme: ButtonThemeData(
      buttonColor: dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    accentIconTheme: IconThemeData(color: dark),
    textTheme: textTheme(),
    accentTextTheme: accentTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      border: new OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      contentPadding: EdgeInsets.only(left: 13),
      fillColor: Colors.black12,
      filled: true,
    ),
  );
}

ThemeData darkThemes() {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
    buttonTheme: ButtonThemeData(
      buttonColor: secondaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    appBarTheme: AppBarTheme(color: bgDark, elevation: 0),
    textTheme: darkTextTheme(),
    scaffoldBackgroundColor: bgDark,
    accentColor: Color(0xff191C24),
    accentTextTheme: accentTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      border: new OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      fillColor: Colors.white12,
      filled: true,
    ),
  );
}
