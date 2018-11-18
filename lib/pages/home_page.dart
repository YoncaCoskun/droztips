import 'package:droztips/pages/card_page.dart';
import 'package:droztips/pages/list_page.dart';
import 'package:droztips/widgets/custom_tab.dart';
import 'package:droztips/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

//const APP_ID = "ca-app-pub-9868823063887131~4682191364";
const APP_ID = "ca-app-pub-9868823063887131~4103892275";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //admob
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: APP_ID != null ? [APP_ID] : null,
    keywords: ['Games', 'Puzzles'],
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  InterstitialAd buildInterstitial() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

//admob

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);

    //admob
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = buildBanner()..load();
    interstitialAd = buildInterstitial()..load();
    //admob
  }

  @override
  void dispose() {
    //admob
    bannerAd?.dispose();
    interstitialAd?.dispose();
    //admob

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bannerAd
      ..load()
      ..show();
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
        title: new Row(
          children: <Widget>[
            //new GradientAppBar("treva"),
            new Text(
              "Dr. Oz Tips",
              style: new TextStyle(
                fontSize: 18.0,
                letterSpacing: 3.0,
                //  fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Acme',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FavoriteButton(
            child: const Icon(
              Icons.favorite,
              color: Color.fromRGBO(235, 64, 107, 1.0),
            ),
          ),
        ],
      ),
      body: new TabBarView(
        children: <Widget>[
          _returnCardPage(),
          _returnListPage(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        child: new TabBar(
          indicatorColor: Colors.grey,
          labelColor: Color.fromRGBO(102, 181, 138, 1.0),
          labelStyle: new TextStyle(fontSize: 14.0),
          tabs: <Tab>[
            CustomTab(tabText: 'Cards', tabIcon: Icons.credit_card),
            CustomTab(tabText: 'List', tabIcon: Icons.list),
          ],
          controller: controller,
        ),
      ),
    );
  }

  _returnListPage() {
    return ListPage();
  }

  _returnCardPage() {
    return CardPage();
  }
}
