import 'package:animeworld/core/models/animeNewsModel.dart';
import 'package:animeworld/core/services/firebaseServices.dart';
import 'package:animeworld/screens/dashboard/AnimeSearch.dart';
import 'package:animeworld/screens/dashboard/AnimeDetails.dart';
import 'package:animeworld/screens/dashboard/NewsDetails.dart';
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

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseNotificationservices _firebaseMessaging =
      locator<FirebaseNotificationservices>();

  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.messageSubscription();
    return MaterialApp(
      title: 'Anime World',
      theme: themes(),
      darkTheme: darkThemes(),
      routes: {
        '/anime': (context) => AnimeDetails(),
        '/news': (context) => NewsDetails(),
        '/anime_search': (context) => AnimeSearch()
      },
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
