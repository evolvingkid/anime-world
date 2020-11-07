import 'package:flutter/material.dart';
import './screens/animeworldscreens.dart';
import 'core/services/dependencyInjection.dart';
import 'core/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime World',
      theme: themes(),
      darkTheme: darkThemes(),
      routes: {},
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
