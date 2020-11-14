import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart' as path_Provider;
import 'package:permission_handler/permission_handler.dart';
import  'package:save_in_gallery/save_in_gallery.dart';

class FileSaverServices {
  Future<Directory> getApplicationDir() async {
    return await path_Provider.getApplicationDocumentsDirectory();
  }

  Future<void> externalApplicationDirSave(
      {String filenames, dynamic data}) async {
 
    if (await Permission.storage.request().isGranted) {
      try {
    
        List<Uint8List> bytesList = [];
        bytesList.add(data);
        final _imageSaver =  ImageSaver();
        final res = await _imageSaver.saveImages(imageBytes: bytesList);
        print(res);
        return null;
      } catch (e) {
        throw e;
      }
    }

    throw 'Error';
  }
}
