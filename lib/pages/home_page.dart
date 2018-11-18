import 'package:droztips/pages/card_page.dart';
import 'package:droztips/pages/list_page.dart';
import 'package:droztips/widgets/custom_tab.dart';
import 'package:droztips/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:droztips/widgets/header_text.dart';

// TODO Encapsulate ADMOB
// TODO Encapsulate Header Text

const APP_ID = "ca-app-pub-9868823063887131~4682191364";
//const APP_ID = "ca-app-pub-9868823063887131~4103892275";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //admob
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: [APP_ID] ?? null,
    keywords: ['Games', 'Puzzles'],
  );
  BannerAd bannerAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);

    //admob
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = buildBanner()..load();
    //admob
  }

  @override
  Widget build(BuildContext context) {
    bannerAd
      ..load()
      ..show(anchorOffset: 100.0);
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
        title: new Row(
          children: <Widget>[
            new HeaderText(
              text: 'Dr. Oz Tips',
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

  @override
  void dispose() {
    bannerAd?.dispose();
    controller.dispose();
    super.dispose();
  }
}
