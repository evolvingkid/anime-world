import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:animeworld/screens/dashboard/AnimeDetails.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import './screens/animeworldscreens.dart';
import 'core/models/animeWallpaperModels.dart';
import 'core/models/animeWorldModel.dart';
import 'core/services/dependencyInjection.dart';
import 'core/themes/themes.dart';
import 'package:path_provider/path_provider.dart' as path_Provider;

void main() async {
  serviceLocators();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumnetDirectory =
      await path_Provider.getApplicationDocumentsDirectory();
  Hive.registerAdapter(AnimeModelsAdapter());
  Hive.registerAdapter(StreamingModelsAdapter());
  Hive.registerAdapter(AnimeAvalibilityAdapter());
  Hive.registerAdapter(AnimeNewsModelAdapter());
  Hive.registerAdapter(AnimeWallpaperModelsAdapter());
  Hive.init(appDocumnetDirectory.path);
  await Hive.openBox('animeData');
  await Hive.openBox('animeNews');
  await Hive.openBox('animeWallpaper');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime World',
      theme: themes(),
      darkTheme: darkThemes(),
      routes: {'/anime': (context) => AnimeDetails()},
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
