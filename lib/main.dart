import 'package:flutter/material.dart';
import './screens/animeworldscreens.dart';
import 'core/services/dependencyInjection.dart';
import 'core/themes/themes.dart';

void main() {
  serviceLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime World',
      theme: themes(),
      routes: {},
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }

 
}
