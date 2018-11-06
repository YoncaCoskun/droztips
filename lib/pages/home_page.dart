import 'package:droztips/pages/card_page.dart';
import 'package:droztips/pages/list_page.dart';
import 'package:droztips/widgets/custom_tab.dart';
import 'package:droztips/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
        centerTitle: true,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "DR. OZ TIPS",
              style: new TextStyle(
                fontSize: 15.0,
                letterSpacing: 3.5,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FavoriteButton(
            child: const Icon(Icons.favorite),
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
