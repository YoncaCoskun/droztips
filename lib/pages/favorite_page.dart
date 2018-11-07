import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc blocFav = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
        centerTitle: true,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Favorites",
              style: new TextStyle(
                fontSize: 15.0,
                letterSpacing: 3.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: blocFav.outFavorites,
        // Display FavoriteWidgets
        builder: (BuildContext context, AsyncSnapshot<List<Tip>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return FavoriteWidget(
                  data: snapshot.data[index],
                  index: index,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
