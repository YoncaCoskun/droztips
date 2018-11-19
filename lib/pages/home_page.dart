import 'package:droztips/pages/card_page.dart';
import 'package:droztips/pages/list_page.dart';
import 'package:droztips/widgets/custom_tab.dart';
import 'package:droztips/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:droztips/widgets/header_text.dart';
import 'package:droztips/api/ad_factory.dart';

// TODO Encapsulate ADMOB
// TODO Encapsulate Header Text

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  AdFactory ad;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);

    ad = new AdFactory()..loadAd();
  }

  @override
  Widget build(BuildContext context) {
    ad.showAd();
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
            CustomTab(tabIcon: Icons.credit_card),
            CustomTab(tabIcon: Icons.list),
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
    ad.dispose();
    controller.dispose();
    super.dispose();
  }
}
