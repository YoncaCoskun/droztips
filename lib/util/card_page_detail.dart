import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/widgets/round_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Tip type;
  final ApplicationBloc tipsBloc;
  final int index;

  const DetailPage({this.type, this.tipsBloc, this.index});

  _DetailPageState createState() =>
      _DetailPageState(type: type, tipsBloc: tipsBloc, index: index);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  Tip type;
  ApplicationBloc tipsBloc;
  int index;

  AnimationController _containerController;
  Animation<double> width;
  Animation<double> height;
  _DetailPageState({this.type, this.tipsBloc, this.index});

  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = new AnimationController(
      duration: new Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
    width = new Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    height = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    height.addListener(() {
      setState(() {
        if (height.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.transparent,
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: height.value,
        color: Colors.transparent,
        child: new Hero(
          tag: type.id,
          child: new Material(
            child: new InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: new Card(
                color: Colors.transparent,
                child: new Container(
                  alignment: Alignment.center,
                  width: width.value,
                  height: height.value,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: new Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      new CustomScrollView(
                        shrinkWrap: false,
                        slivers: <Widget>[
                          new SliverAppBar(
                            elevation: 0.0,
                            forceElevated: true,
                            leading: new IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: new Icon(
                                Icons.arrow_back,
                                color: Colors.cyan,
                                size: 30.0,
                              ),
                            ),
                            expandedHeight: _appBarHeight,
                            pinned: _appBarBehavior == AppBarBehavior.pinned,
                            floating:
                                _appBarBehavior == AppBarBehavior.floating ||
                                    _appBarBehavior == AppBarBehavior.snapping,
                            snap: _appBarBehavior == AppBarBehavior.snapping,
                            flexibleSpace: new FlexibleSpaceBar(
                              background: new Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  new Container(
                                    width: width.value,
                                    height: _appBarHeight,
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                          image: new NetworkImage(type.image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new SliverList(
                            delegate: new SliverChildListDelegate(<Widget>[
                              new Container(
                                color: Colors.white,
                                child: new Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0, bottom: 8.0),
                                        child: new Text(
                                          type.title,
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      new Text(type.tip),
                                      new Container(
                                        height: 100.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      new Container(
                          width: 600.0,
                          height: 80.0,
                          decoration: new BoxDecoration(
                            color: Color.fromRGBO(234, 245, 240, 1.0),
                          ),
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new RoundIconButton.small(
                                icon: type.favorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                iconColor: Color.fromRGBO(235, 64, 107, 1.0),
                                onPressed: () {
                                  // Some code to undo the change!
                                  tipsBloc.inIndex.add(index);

                                  //Scaffold.of(context).showSnackBar(snackBar);
                                },
                                fillColor: Colors.white,
                              ),
                              /*new RoundIconButton.large(
                                icon: Icons.favorite,
                                iconColor: Colors.white,
                                onPressed: () {},
                              ),*/
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
