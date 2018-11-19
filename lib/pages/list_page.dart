import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/util/card_page_detail.dart';
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
      body: _buildListView(tipsBloc),
    );
  }

  Future<void> _openDialog({Tip item}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(item.tip),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Column buildButtonColumn(IconData icon) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Icon(icon, color: color),
      ],
    );
  }

  Widget _buildListView(ApplicationBloc tipsBloc) {
    return StreamBuilder<List<Tip>>(
      stream: tipsBloc.outTipList,
      builder: (BuildContext context, AsyncSnapshot<List<Tip>> snapshot) {
        return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          padding: new EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              elevation: 1.7,
              child: new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  children: [
                    new Row(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            snapshot.data[index].title,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      children: [
                        new Expanded(
                          child: new GestureDetector(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                new Padding(
                                  padding: new EdgeInsets.only(
                                      left: 4.0,
                                      right: 8.0,
                                      bottom: 8.0,
                                      top: 8.0),
                                  child: new Text(snapshot.data[index].tip),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                        new Column(
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.only(top: 8.0),
                              child: new SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child:
                                    /*new Image.network(
                                  snapshot.data[index].image,
                                  fit: BoxFit.cover,
                                ),*/
                                    new Image.asset(
                                  snapshot.data[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            new Row(
                              children: <Widget>[
                                new GestureDetector(
                                  child: new Padding(
                                    padding: new EdgeInsets.all(5.0),
                                    child: new Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        new RawMaterialButton(
                                          onPressed: () {
                                            tipsBloc.inIndex.add(index);
                                            print('onpress');
                                          },
                                          child: new Icon(
                                            snapshot.data[index].favorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Color.fromRGBO(
                                                235, 64, 107, 1.0),
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
                                  onTap: () {
                                    /* _onRemoveSource(
                                        data["articles"][index]["source"]["id"],
                                        data["articles"][index]["source"]
                                            ["name"]);*/
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ), ////
              ),
            );
          },
        );
        /*ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            if (!snapshot.hasData) {
              CircularProgressIndicator();
            }

            return Card(
              child: new ListTile(
                leading: new Image.asset(
                  snapshot.data[index].image,
                  height: 50.0,
                  width: 50.0,
                ),
                title: new Text(snapshot.data[index].title),
                subtitle: new Text("test"),
                trailing: new Column(
                  children: <Widget>[
                    new RawMaterialButton(
                      onPressed: () {
                        tipsBloc.inIndex.add(index);
                        print('onpress');
                      },
                      child: new Icon(
                        snapshot.data[index].favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Color.fromRGBO(235, 64, 107, 1.0),
                        size: 18.0,
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                ),
                onTap: () {
                  _openDialog(item: snapshot.data[index]);
                },
                onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new DetailPage(
                            type: snapshot.data[index],
                            tipsBloc: tipsBloc,
                            index: index),
                      ),
                    ),
              ),
            );
          },
        );*/
      },
    );
  }
}
