import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Your bannerAdUnitId for Android
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Your bannerAdUnitId for Ios
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712"; // Your intersitialAdUnitId for Android
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910"; // Your intersitialAdUnitId for Ios
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917"; // Your rewarderAdUnitId for Android
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313"; // Your rewarderAdUnitId for Ios
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
