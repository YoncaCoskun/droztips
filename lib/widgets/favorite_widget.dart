import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
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
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
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

      /*child: ListTile(
        leading: Container(
          width: 100.0,
          height: 100.0,
          child: new Image.asset(data.image, fit: BoxFit.contain),
          Image.network(data.image,
              fit: BoxFit.contain),
        ),
        title: Text(data.title),
        //subtitle: Text(data.overview, style: TextStyle(fontSize: 10.0)),
        trailing: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            //bloc.inRemoveFavorite.add(data);
          },
        ),
      ),*/
      child: new ListTile(
        leading: new Image.asset(
          data.image,
          height: 50.0,
          width: 50.0,
        ),
        title: new Text(data.title),
        subtitle: new Text("test"),
        trailing: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            bloc.inRemoveFavorite.add(index);
          },
        ),
      ),
    );
  }
}
