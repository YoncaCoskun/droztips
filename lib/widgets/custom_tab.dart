import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget implements Tab {
  final String tabText;
  final IconData tabIcon;

  CustomTab({Key key, this.tabText, this.tabIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: new Icon(
        tabIcon,
        color: Color.fromRGBO(102, 181, 138, 1.0),
      ),
      text: tabText,
    );
  }

  @override
  Widget get child => null;

  @override
  Widget get icon => null;

  @override
  String get text => null;
}
