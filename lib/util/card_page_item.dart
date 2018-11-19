import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';

class CardItem extends StatelessWidget {
  final Tip item;
  final ApplicationBloc tipsBloc;
  final int index;

  CardItem({
    @required this.item,
    this.tipsBloc,
    this.index,
  });

  _buildTextContainer(
      BuildContext context, ApplicationBloc tipsBloc, int index) {
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;

    var image = Image.network(
      item.image,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.6,
        0.5,
      ),
    );
    /*Image.asset(
      item.image,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.6,
        0.5,
      ),
    );*/

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
