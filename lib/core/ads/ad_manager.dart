import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6307776933822297~7072673641";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544~2594085930"; //test
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8865242552";//test
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4339318960";//test
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String homeBanner="ca-app-pub-6307776933822297/3031332764";
  static String animeBanner="ca-app-pub-6307776933822297/5889430397";
  static String animeDetailsBanner="ca-app-pub-6307776933822297/5258875005";
  static String animeDetailsSquareBanner="ca-app-pub-6307776933822297/3945793333";
  static String wallpaperBanner="ca-app-pub-6307776933822297/9006548328";
  static String viewwallpaperBanner="ca-app-pub-6307776933822297/8324022043";
  static String newsBanner="ca-app-pub-6307776933822297/8635013239";
  static String viewnewsBanner="ca-app-pub-6307776933822297/5181007474";
  static String viewnewsSquareBanner="ca-app-pub-6307776933822297/6661594190";
  static String allanimeBanner="ca-app-pub-6307776933822297/4035430854";
  static String animeSearchBanner="ca-app-pub-6307776933822297/2722349181";

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/7049598008";//test
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/3964253750";//test
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8673189370";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/7552160883";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}