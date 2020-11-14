import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart' as path_Provider;
import 'package:permission_handler/permission_handler.dart';
import 'package:crypto/crypto.dart' as crypto;
import  'package:save_in_gallery/save_in_gallery.dart';

class FileSaverServices {
  Future<Directory> getApplicationDir() async {
    return await path_Provider.getApplicationDocumentsDirectory();
  }

  Future<void> externalApplicationDirSave(
      {String filenames, dynamic data}) async {
    var bytes = utf8.encode(filenames);
    var hashData = crypto.md5.convert(bytes);

    if (await Permission.storage.request().isGranted) {
      try {
        Directory dir = await path_Provider.getExternalStorageDirectory();
        String _downloadDir = dir.path;
        final String _filePath = '$_downloadDir/$hashData.jpg';
        File _file = File(_filePath);
        var raf = _file.openSync(mode: FileMode.write);
        raf.writeFromSync(data);
        await raf.close();
     
       
        List<Uint8List> bytesList = [];
        bytesList.add(data);
        final _imageSaver =  ImageSaver();
        final res = await _imageSaver.saveImages(imageBytes: bytesList);
   
        return null;
      } catch (e) {
     
        throw e;
      }
    }

    throw 'Error';
  }
}
