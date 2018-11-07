import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:droztips/util/card_page_detail.dart';
import 'package:droztips/util/card_page_item.dart';
import 'package:flutter/material.dart';
import 'package:droztips/blocs/application_bloc.dart';

class CardPage extends StatefulWidget {
  @override
  CardPageState createState() => new CardPageState();
}

class CardPageState extends State<CardPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc tipsBloc = BlocProvider.of<ApplicationBloc>(context);
    return (new Scaffold(
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

  //----Build Body -----
  Widget _buildCardStack(ApplicationBloc tipsBloc) {
    return StreamBuilder<List<Tip>>(
      stream: tipsBloc.outTipList,
      builder: (BuildContext context, AsyncSnapshot<List<Tip>> snapshot) {
        return new PageView.builder(
          controller: PageController(viewportFraction: 0.85),
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            if (!snapshot.hasData) {
              CircularProgressIndicator();
            }

            final item = snapshot.data[index];
            final i = index;
            return new Hero(
              tag: item.id,
              child: new Material(
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new DetailPage(
                          type: item, tipsBloc: tipsBloc, index: i))),
                  child: CardItem(
                    item: item,
                    tipsBloc: tipsBloc,
                    index: i,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
