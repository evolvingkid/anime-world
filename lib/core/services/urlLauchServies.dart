import 'package:url_launcher/url_launcher.dart';

class URLLaunchServices {
  Future<void> launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw e;
    }
  }
}
