import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/pages/favorite_page.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc blocFav = BlocProvider.of<ApplicationBloc>(context);
    return RaisedButton(
      elevation: 0.0,
      color: Color.fromRGBO(102, 181, 138, 1.0),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return FavoritesPage();
        }));
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          child,
          Positioned(
            top: -12.0,
            right: -6.0,
            child: Material(
              type: MaterialType.transparency,
              elevation: 2.0,
              color: Color.fromRGBO(235, 64, 107, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: StreamBuilder<int>(
                  stream: blocFav.outTotalFav,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
