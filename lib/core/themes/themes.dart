import 'package:flutter/material.dart';
import 'textThemes/accentTextTheme.dart';

ThemeData themes() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffF6F9FF),
    accentColor: Color(0xff191C24),
    accentTextTheme: accentTextTheme(),
  );
}


