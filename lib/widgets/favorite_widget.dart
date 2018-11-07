import 'package:droztips/models/tip.dart';
import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({
    Key key,
    this.data,
    this.index,
  }) : super(key: key);

  final Tip data;
  final int index;

  @override
  Widget build(BuildContext context) {
    //final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black54,
          ),
        ),
      ),
      child: new ListTile(
        leading: new Image.asset(
          data.image,
          height: 50.0,
          width: 50.0,
        ),
        title: new Text(data.title),
        subtitle: new Text("test"),
      ),
    );
  }
}
