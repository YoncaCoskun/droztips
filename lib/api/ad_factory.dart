import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

const APP_ID_ANDROID = "ca-app-pub-9868823063887131~4682191364";
//const APP_ID_IOS = "ca-app-pub-9868823063887131~4103892275";

class AdFactory {
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: [APP_ID_ANDROID] ?? null,
    keywords: ['Games', 'Puzzles'],
  );
  BannerAd bannerAd;

  AdFactory() {
    FirebaseAdMob.instance.initialize(appId: APP_ID_ANDROID);
  }
  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  loadAd() {
    bannerAd = buildBanner()..load();
  }

  showAd() {
    bannerAd
      ..load()
      ..show(anchorOffset: 50.0);
  }

  dispose() {
    bannerAd?.dispose();
  }
}
