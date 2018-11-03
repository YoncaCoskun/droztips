import 'package:droztips/models/tip.dart';
import 'package:droztips/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CardItem extends StatelessWidget {
  CardItem({
    @required this.item,
  });
  final Tip item;

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

  _buildTextContainer(BuildContext context) {
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
              icon: Icons.favorite,
              iconColor: Colors.white,
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Beğendiniz !'),
                  action: SnackBarAction(
                    label: '',
                    onPressed: () {
                      // Some code to undo the change!
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
    /* Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //categoryText,
          titleText,
          new RoundIconButton.large(
            icon: Icons.favorite,
            iconColor: Colors.white,
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Beğendiniz !'),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {
                    // Some code to undo the change!
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
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
            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}
