import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/util/card_page_item.dart';
import 'package:flutter/material.dart';
import 'package:droztips/blocs/application_bloc.dart';

class CardPage extends StatefulWidget {
  @override
  CardPageState createState() => new CardPageState();
}

class CardPageState extends State<CardPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc tipsBloc = BlocProvider.of<ApplicationBloc>(context);
    return (new Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildCardStack(tipsBloc),
    ));
  }

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //----Build App Bar-----
  Widget _buildAppBar() {
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
      centerTitle: true,
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "DR. OZ TIPS",
            style: new TextStyle(
              fontSize: 15.0,
              letterSpacing: 3.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //----Build Body -----
  Widget _buildCardStack(ApplicationBloc tipsBloc) {
    return StreamBuilder<List<Tip>>(
      stream: tipsBloc.outTipList,
      builder: (BuildContext context, AsyncSnapshot<List<Tip>> snapshot) {
        return PageView.builder(
          controller: PageController(viewportFraction: 0.85),
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            final item = snapshot.data[index];
            //final pageVisibility = visibilityResolver.resolvePageVisibility(index);
            return CardItem(
              item: item,
              //pageVisibility: pageVisibility,
            );
          },
        );
      },
    );
  }
}
