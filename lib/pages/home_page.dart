import 'package:droztips/pages/card_page.dart';
import 'package:droztips/pages/list_page.dart';
import 'package:droztips/widgets/custom_tab.dart';
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
      body: new TabBarView(
        children: <Widget>[_returnCardPage(), _returnListPage()],
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
