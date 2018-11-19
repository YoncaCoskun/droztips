import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  HeaderText({this.text, Key key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: new TextStyle(
        fontSize: 18.0,
        letterSpacing: 3.0,
        color: Colors.white,
        fontFamily: 'Acme',
      ),
    );
  }
}
