import 'package:animeworld/Custom/ImageOrNetwork.dart';
import 'package:animeworld/core/models/animeWallpaperModels.dart';
import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:flutter/material.dart';

class ViewWallpaper extends StatefulWidget {
  @override
  _ViewWallpaperState createState() => _ViewWallpaperState();
}

class _ViewWallpaperState extends State<ViewWallpaper> {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();
  FileSaverServices _fileSaverServices = locator<FileSaverServices>();
  bool _isLoading = false;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void notification({String message}) {
    final snackBar = SnackBar(content: Text(message));
    _key.currentState.showSnackBar(snackBar);
  }

  void save(AnimeWallpaperModels data) async {
    bool _isErrorOccred = false;
    setState(() => _isLoading = true);
    final imageData = await _dioAPIServices.downloadFile(url: data.image);

    await _fileSaverServices
        .externalApplicationDirSave(filenames: data.image, data: imageData)
        .catchError((e) {
      notification(message: 'Error occred');
      _isErrorOccred = true;
    });

    setState(() => _isLoading = false);

    if (!_isErrorOccred) {
      notification(message: 'Image is saved to Pictures');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AnimeWallpaperModels data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        key: _key,
        floatingActionButton: saveToGalleryBtn(data, context),
        body: Center(child: ImageOrNetWork(url: data.image)),
        bottomNavigationBar: loadingScreen());
  }

  Widget loadingScreen() => _isLoading
      ? Container(
          height: 3,
          width: double.infinity,
          child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor))
      : null;

  RaisedButton saveToGalleryBtn(
      AnimeWallpaperModels data, BuildContext context) {
    return RaisedButton(
      onPressed: () => save(data),
      child: Text(
        "Save to gallery",
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
