import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CardItem extends StatelessWidget {
  final Tip item;
  ApplicationBloc tipsBloc;
  int index;

  CardItem({
    @required this.item,
    this.tipsBloc,
    this.index,
  });

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = 0.2;

    return Opacity(
      opacity: 0.8,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(
      BuildContext context, ApplicationBloc tipsBloc, int index) {
    /*var textTheme = Theme.of(context).textTheme;
    var titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );*/

    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ]),
        ),
        padding: const EdgeInsets.all(24.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  item.title,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                )
              ],
            )),
            new RoundIconButton.small(
              icon: item.favorite ? Icons.favorite : Icons.favorite_border,
              iconColor: Color.fromRGBO(235, 64, 107, 1.0),
              onPressed: () {
                // Some code to undo the change!
                tipsBloc.inIndex.add(index);

                //Scaffold.of(context).showSnackBar(snackBar);
              },
              fillColor: Colors.white,
            ),
            /*new RawMaterialButton(
              onPressed: () {
                tipsBloc.inIndex.add(index);
              },
              child: new Icon(
                item.favorite ? Icons.favorite : Icons.favorite_border,
                color: Color.fromRGBO(235, 64, 107, 1.0),
                size: 18.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(12.0),
            ),*/
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //tipsBloc = BlocProvider.of<ApplicationBloc>(context);
    var image = Image.asset(
      item.image,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.6,
        0.5,
      ),
    );

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 90.0,
        horizontal: 8.0,
      ),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            image,
            imageOverlayGradient,
            _buildTextContainer(context, tipsBloc, index),
          ],
        ),
      ),
    );
  }
}
