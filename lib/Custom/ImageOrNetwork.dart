import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class GetImageOrNetwork extends _ImageOrNetWorkState {
  String pathFromUrl({String url, String ext = ".png"}) {
    return generateFileName(url, ext);
  }

  Future<File> moveImageTo(
      {String url, String toPath, String ext = ".png"}) async {
    String filename = generateFileName(url, ext);
    final appDocDir = await getApplicationDocumentsDirectory();
    String filePathName = p.join(appDocDir.path, filename);
    File image = File(filePathName);
    image.copy(p.join(toPath, filename));
    return image;
  }
}

class ImageOrNetWork extends StatefulWidget {
  ImageOrNetWork({
    this.fit,
    this.width,
    this.height,
    this.ext = '.png',
    this.url =
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx111500-YqqWk16db7FX.jpg",
    this.id,
  });

  final BoxFit fit;
  final double width, height;
  final String ext;
  final String url, id;

  @override
  _ImageOrNetWorkState createState() => _ImageOrNetWorkState();
}

class _ImageOrNetWorkState extends State<ImageOrNetWork> {
  generateFileName(String data, String ext) {
    return hex.encode(crypto.md5.convert(Utf8Encoder().convert(data)).bytes) +
        ext;
  }

  File img;

  Future<String> getPath({String url, String ext}) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String pathName = p.join(appDocDir.path, generateFileName(url, ext));
    return pathName;
  }

  Future<File> fileFromDocsDir(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String pathName = p.join(appDocDir.path, filename);
    return File(pathName);
  }

  Future<String> downloadFile({
    String url,
    String fileName,
    String fileExtension,
    Function(int, int) onReceiveProgress,
  }) async {
    String _url = url;
    Dio dio = Dio();
    final appDocumnetDirectory = await getApplicationDocumentsDirectory();
    final String _filepath =
        '${appDocumnetDirectory.path}/$fileName$fileExtension';

    try {
      Response response = await dio.get(
        _url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) => status < 500,
        ),
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode < 200 && response.statusCode > 226)
        throw HttpException("Server Error");

      File file = File(_filepath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return _filepath;
    } catch (e) {
      throw e;
    }
  }

  getImage() async {
    String imgPath = generateFileName(widget.url, widget.ext);
    File imageFile = await fileFromDocsDir(imgPath + widget.ext);
    if (await imageFile.exists()) {
      // print(imageFile.path + "  Exist");
      if (!mounted) return;
      setState(() {
        img = imageFile;
      });
    } else {
      // print(imageFile.path + " Not Exist");
      await downloadFile(
        url: widget.url,
        fileName: imgPath,
        fileExtension: widget.ext,
        onReceiveProgress: (cur, tot) {
          //  print(cur);
          // print(tot);
        },
      );
      if (!mounted) return;

      setState(() {
        img = imageFile;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getImage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ImageOrNetWork oldWidget) {
    getImage();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: img != null
          ? Material(
              child: Image.file(
                img,
                height: widget.height,
                width: widget.width,
                fit: widget.fit,
                alignment: Alignment.topCenter,
              ),
            )
          : Image.asset(
              'assets/images/logo.png',
              height: widget.height,
              width: widget.width,
              fit: widget.fit,
            ),
    );
  }
}
