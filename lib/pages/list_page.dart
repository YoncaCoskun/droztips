import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc tipsBloc = BlocProvider.of<ApplicationBloc>(context);
    return new Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildListView(tipsBloc),
    );
  }

  Widget _buildAppBar() {
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
      centerTitle: true,
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'List',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(ApplicationBloc tipsBloc) {
    return StreamBuilder<List<Tip>>(
      stream: tipsBloc.outTipList,
      builder: (BuildContext context, AsyncSnapshot<List<Tip>> snapshot) {
        return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: new ListTile(
                /*leading: new Image.asset(
                  snapshot.data[index].image,
                  height: 50.0,
                  width: 50.0,
                ),*/
                title: new Text(snapshot.data[index].title),
                subtitle: new Text("test"),
                trailing: new Column(
                  children: <Widget>[
                    new RawMaterialButton(
                      onPressed: () {},
                      child: new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 18.0,
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
